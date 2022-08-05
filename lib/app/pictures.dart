import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_pictures/app/widgets/error.dart';
import 'package:nasa_pictures/app/widgets/picture.dart';
import 'package:nasa_pictures/configs/logging.dart';
import 'package:nasa_pictures/data/picture.dart';
import 'package:nasa_pictures/navigation/router.dart';

import '../modules/search.dart';
import '../utils/date.dart';
import 'gallery/conrollers.dart';
import 'widgets/overshadow.dart';
import 'widgets/no_results.dart';

final indexedItemProvider = Provider.family.autoDispose((ref, int index) {
  final pagination = ref.read(itemsPaginationControllerProvider.notifier);
  final values = ref.watch(
    itemsPaginationControllerProvider.select((value) => value.iterable),
  );
  if (values == null) return null;

  return ref.watch(filteredValuesProvider(values).select((data) {
    final length = data.length;
    if (length - 1 == index) {
      pagination.requestFetch();
    }
    return data.elementAt(index);
  }));
});

final informationVisibilityController = StateProvider((ref) {
  return true;
});

final panModeEnabledController = StateProvider((ref) {
  return false;
});

final filteredValuesLengthProvider = Provider((ref) {
  return ref.watch(filteredValuesProvider(ref.watch(
    itemsPaginationControllerProvider.select(
      (value) => value.iterable ?? const [],
    ),
  )).select((value) => value.length));
});

class PicturesScreen extends StatefulWidget {
  const PicturesScreen({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  static const $routePath = '/item/:index';
  static String routePath(int index) => '/item/$index';

  static final route = GoRoute(
    path: $routePath,
    builder: (context, s) {
      return PicturesScreen(
        index: int.parse(getTypeIf<String>(s.params['index'])!),
      );
    },
  );

  @override
  State<PicturesScreen> createState() => _PicturesScreenState();
}

const _pageScrollDuration = Duration(milliseconds: 300);
const _pageScrollCurve = Curves.easeInOut;

class _PicturesScreenState extends State<PicturesScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.index);
  }

  @override
  void didUpdateWidget(covariant PicturesScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    final currentPage = pageController.page?.round();
    if (currentPage != null && widget.index != currentPage) {
      logging('_PicturesScreenState.didUpdateWidget').info(
        'animating to page ${widget.index}',
      );

      pageController.animateToPage(
        widget.index,
        duration: _pageScrollDuration,
        curve: _pageScrollCurve,
      );
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: const [
          PanModeToggleButton(),
          MetadataToggleButton(),
        ],
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
      ),
      body: PicturesScreenBody(
        index: widget.index,
        controller: pageController,
      ),
    );
  }
}

class MetadataToggleButton extends StatelessWidget {
  const MetadataToggleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final isVisible = ref.watch(informationVisibilityController);

        void toggle() {
          ref
              .read(informationVisibilityController.notifier)
              .update((state) => !state);
        }

        return Padding(
          padding: const EdgeInsetsDirectional.only(end: 16.0),
          child: TextButton.icon(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: toggle,
            icon: isVisible
                ? const Icon(FluentIcons.eye_off_24_regular)
                : const Icon(FluentIcons.eye_24_regular),
            label: isVisible ? const Text('Hide') : const Text('Info'),
          ),
        );
      },
    );
  }
}

class PanModeToggleButton extends StatelessWidget {
  const PanModeToggleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final isVisible = ref.watch(panModeEnabledController);
        void toggle() {
          ref.read(panModeEnabledController.notifier).update((state) => !state);
        }

        return Padding(
          padding: const EdgeInsetsDirectional.only(end: 16.0),
          child: IconButton(
            onPressed: toggle,
            icon: isVisible
                ? const Icon(FluentIcons.phone_span_out_24_regular)
                : const Icon(FluentIcons.arrow_expand_24_regular),
            tooltip: isVisible
                ? 'Enable scrolling horizontally to change page'
                : 'Enable pan & zoom',
          ),
        );
      },
    );
  }
}

class PicturesScreenBody extends ConsumerWidget {
  const PicturesScreenBody({
    Key? key,
    required this.index,
    required this.controller,
  }) : super(key: key);

  final int index;
  final PageController controller;

  Future<void> toPage(int? Function(int current) page) {
    final sc = controller;

    final oldIndex = sc.page?.round();
    if (oldIndex == null) return Future.value();
    final newIndex = page(oldIndex);
    if (newIndex == null) return Future.value();

    return sc.animateToPage(
      newIndex,
      duration: _pageScrollDuration,
      curve: _pageScrollCurve,
    );
  }

  Future<void> toPreviousPage() {
    return toPage((a) {
      if (a == 0) return null;
      return a - 1;
    });
  }

  Future<void> toNextPage(WidgetRef ref) {
    return toPage((a) {
      if (a == ref.read(filteredValuesLengthProvider) - 1) return null;
      return a + 1;
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valuesLength = ref.watch(filteredValuesLengthProvider);

    if (valuesLength == 0) {
      return NoResults(
        wasSearched: ref.watch(isSearchedAttemptedProvider),
        onRefreshPress: () {
          ref.refresh(itemsPaginationControllerProvider);
        },
      );
    }

    return Stack(
      children: [
        PageView.builder(
          controller: controller,
          itemBuilder: (context, index) {
            final item = ref.watch(indexedItemProvider(index));
            if (item == null) {
              return ErrorPlaceholderWidget('Failed loading at $index', null);
            }

            return PicturePage(
              item: item,
            );
          },
          onPageChanged: (index) {
            context.replace(PicturesScreen.routePath(index));
          },
          itemCount: valuesLength,
        ),
        AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            final page = controller.page;

            return Consumer(builder: (context, ref, __) {
              final isInfoVisible = ref.watch(informationVisibilityController);
              if (isInfoVisible || (page != null && page <= 0)) {
                return const SizedBox();
              }

              return Align(
                alignment: AlignmentDirectional.centerStart,
                child: IconButton(
                  onPressed: toPreviousPage,
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  color: Colors.white,
                ),
              );
            });
          },
        ),
        AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            final page = controller.page;

            return Consumer(builder: (context, ref, __) {
              final isInfoVisible = ref.watch(informationVisibilityController);
              if (isInfoVisible || (page != null && page > valuesLength)) {
                return const SizedBox();
              }

              return Align(
                alignment: AlignmentDirectional.centerEnd,
                child: IconButton(
                  onPressed: () => toNextPage(ref),
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  color: Colors.white,
                ),
              );
            });
          },
        ),
      ],
    );
  }
}

class PicturePage extends ConsumerStatefulWidget {
  const PicturePage({
    Key? key,
    required this.item,
  }) : super(key: key);

  final SamplePicture item;

  @override
  ConsumerState<PicturePage> createState() => _PicturePageState();
}

class _PicturePageState extends ConsumerState<PicturePage> {
  late TransformationController controller;

  @override
  void initState() {
    super.initState();
    controller = TransformationController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer(
          builder: (context, ref, child) {
            final isPanEnabled = ref.watch(panModeEnabledController);
            return InteractiveItemImage(
              controller: controller,
              item: widget.item,
              isPanEnabled: isPanEnabled,
              isDarkMode: true,
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            final isVisible = ref.watch(informationVisibilityController);

            return IgnorePointer(
              ignoring: !isVisible,
              child: Overshadow(
                isVisible: isVisible,
                child: child!,
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: ItemMetaData(
                  item: widget.item,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ItemMetaData extends StatelessWidget {
  const ItemMetaData({
    Key? key,
    required this.item,
  }) : super(key: key);

  final SamplePicture item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.typography.white;

    final size = MediaQuery.of(context).size;

    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: size.width / 18,
        vertical: 40.0,
      ).add(const EdgeInsets.only(top: 80)),
      children: [
        SelectableText(
          item.title ?? '-',
          textAlign: TextAlign.start,
          style: textTheme.headlineMedium,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            bottom: 20.0,
          ),
          child: Text.rich(
            TextSpan(
              children: [
                WidgetSpan(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 4.0),
                    child: Icon(
                      FluentIcons.calendar_ltr_12_regular,
                      size: 16,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
                TextSpan(
                  text: neatlyFormatDate(
                        context,
                        item.date,
                      ) ??
                      '',
                ),
              ],
            ),
            style: textTheme.labelSmall?.merge(TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
            )),
            textAlign: TextAlign.start,
          ),
        ),
        SelectableText(
          item.explanation ?? '',
          textAlign: TextAlign.start,
          style: textTheme.bodyLarge,
        ),
      ],
    );
  }
}
