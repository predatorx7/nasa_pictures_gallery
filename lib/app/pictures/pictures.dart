import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:nasa_pictures/app/widgets/error.dart';
import 'package:nasa_pictures/app/widgets/picture.dart';
import 'package:nasa_pictures/configs/logging.dart';
import 'package:nasa_pictures/data/picture.dart';
import 'package:nasa_pictures/navigation/router.dart';

import '../../modules/search.dart';
import '../../utils/date.dart';
import '../home/gallery/conrollers.dart';
import '../widgets/overshadow.dart';
import '../widgets/no_results.dart';

part 'buttons.dart';
part 'controllers.dart';

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
    // disposed when overriding provider scope is removed
    // pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: const [
          InteractiveViewToggleButton(),
          MetadataToggleButton(),
        ],
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
      ),
      body: ProviderScope(
        overrides: [
          picturesPageViewControllerProvider.overrideWithValue(pageController),
        ],
        child: const PicturesScreenBody(),
      ),
    );
  }
}

class PicturesScreenBody extends ConsumerWidget {
  const PicturesScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valuesLHaveLengthZero = ref.watch(filteredValuesLengthProvider.select(
      (value) => value == 0,
    ));

    if (valuesLHaveLengthZero) {
      return const _NoResultsPage();
    }

    return Stack(
      children: const [
        PicturesPageView(),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: PreviousPageButton(),
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: NextPageButton(),
        ),
      ],
    );
  }
}

class PicturesPageView extends ConsumerWidget {
  const PicturesPageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final valuesLength = ref.watch(filteredValuesLengthProvider);

    return PageView.builder(
      controller: ref.watch(picturesPageViewControllerProvider),
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
            final isInteractiveViewEnabled =
                ref.watch(isInteractiveViewEnabledController);
            return InteractiveItemImage(
              controller: controller,
              item: widget.item,
              isInteractiveViewEnabled: isInteractiveViewEnabled,
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
          style: textTheme.headlineLarge,
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
                  ),
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

class _NoResultsPage extends ConsumerWidget {
  const _NoResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NoResults(
      wasSearched: ref.watch(isSearchedAttemptedProvider),
      onRefreshPress: () {
        ref.refresh(itemsPaginationControllerProvider);
      },
    );
  }
}
