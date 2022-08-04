import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_pictures/app/widgets/error.dart';
import 'package:nasa_pictures/app/widgets/picture.dart';
import 'package:nasa_pictures/configs/logging.dart';
import 'package:nasa_pictures/data/picture.dart';
import 'package:nasa_pictures/navigation/router.dart';

import '../modules/search.dart';
import 'gallery/conrollers.dart';
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
    logging('_PicturesScreenState.initState').info('initialized');
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
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PicturesScreenBody(
        index: widget.index,
        controller: pageController,
      ),
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valuesLength = ref.watch(filteredValuesProvider(ref.watch(
      itemsPaginationControllerProvider.select(
        (value) => value.iterable ?? const [],
      ),
    )).select((value) => value.length));

    if (valuesLength == 0) {
      return NoResults(
        wasSearched: ref.watch(isSearchedAttemptedProvider),
        onRefreshPress: () {
          ref.refresh(itemsPaginationControllerProvider);
        },
      );
    }

    return PageView.builder(
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
    );
  }
}

class PicturePage extends StatefulWidget {
  const PicturePage({
    Key? key,
    required this.item,
  }) : super(key: key);

  final SamplePicture item;

  @override
  State<PicturePage> createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
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
    return InteractiveItemImage(
      controller: controller,
      item: widget.item,
    );
  }
}
