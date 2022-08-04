import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/pagination.dart';
import '../../data/picture.dart';
import '../../modules/gallery.dart';
import '../../modules/pagination.dart';
import '../../modules/search.dart';
import '../widgets/error.dart';
import '../widgets/loading.dart';
import '../widgets/no_results.dart';
import '../widgets/picture.dart';

final itemsPaginationControllerProvider = StateNotifierProvider<
    PaginatedDataController<SamplePicture>,
    PaginationData<SamplePicture>>((ref) {
  final repo = ref.watch(galleryItemsRepository);

  return PaginatedDataController(fetch: (current, limit) {
    return repo.getPictures(page: current, size: limit);
  });
});

final paginationProvider = Provider.autoDispose((ref) {
  return ref.watch(
    itemsPaginationControllerProvider.notifier.select((value) => value),
  );
});

class GalleryItems extends ConsumerWidget {
  const GalleryItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagination = ref.watch(paginationProvider);

    return NotificationListener<ScrollUpdateNotification>(
      onNotification: pagination.onScrollUpdate,
      child: Consumer(
        builder: (context, ref, _) {
          final pagination = ref.watch(itemsPaginationControllerProvider);
          final values = pagination.iterable;
          final valueAsync = pagination.value;

          // void onRetry() {
          //   ref.refresh(itemsPaginationControllerProvider);
          // }

          if (valueAsync is AsyncLoading) {
            return const LoadingWidget();
          } else if (values == null || values.isEmpty) {
            final errorValue =
                valueAsync is AsyncError ? (valueAsync as AsyncError) : null;
            return ErrorPlaceholderWidget(
              errorValue?.error,
              errorValue?.stackTrace,
            );
          }

          const sliverNothing = SliverToBoxAdapter(child: SizedBox());

          return CustomScrollView(
            slivers: [
              // To avoid a rendering bug which occurs when first item in a custom scroll view changes.
              sliverNothing,
              if (values.isNotEmpty) ItemsGridView(data: values),
              if (valueAsync is AsyncData && pagination.nextAvailable)
                const SliverLoadingWidget(),
              if (valueAsync is AsyncError)
                SliverErrorPlaceholderWidget(
                  (valueAsync as AsyncError).error,
                  (valueAsync as AsyncError).stackTrace,
                ),
            ],
          );
        },
      ),
    );
  }
}

final filteredValuesProvider = Provider.family((
  ref,
  Iterable<SamplePicture> values,
) {
  final query = ref.watch(browsingSearchQueryProvider);
  final isSearched = ref.watch(isSearchedAttemptedProvider);

  if (isSearched) {
    return values.where(
      (item) => item.title?.contains(query!) == true,
    );
  } else {
    return values;
  }
});

class ItemsGridView extends ConsumerWidget {
  const ItemsGridView({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Iterable<SamplePicture> data;

  void onGridTileSelected(
    BuildContext context,
    int index,
    SamplePicture item,
  ) {
    //
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = ref.watch(filteredValuesProvider(data));

    if (values.isEmpty) {
      return SliverNoResults(
        wasSearched: ref.watch(isSearchedAttemptedProvider),
        onRefreshPress: () {
          ref.refresh(itemsPaginationControllerProvider);
        },
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.70,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = values.elementAt(index);

            return ItemTile(
              picture: item,
              onItemSelected: () => onGridTileSelected(context, index, item),
            );
          },
          childCount: values.length,
        ),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key? key,
    required this.picture,
    required this.onItemSelected,
  }) : super(key: key);

  final SamplePicture picture;
  final VoidCallback? onItemSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemSelected,
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: AspectRatio(
              aspectRatio: 1,
              child: ItemImage(item: picture),
            ),
          ),
          ItemTileBar(
            item: picture,
          ),
        ],
      ),
    );
  }
}
