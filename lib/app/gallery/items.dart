import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/picture.dart';
import '../../modules/gallery.dart';
import '../widgets/error.dart';
import '../widgets/loading.dart';

const pageSize = 10;

final paginatedItemsProvider =
    FutureProvider.family<List<SamplePicture>, int>((ref, int pageIndex) {
  final repo = ref.watch(galleryItemsRepository);

  return repo.getPictures(page: pageIndex, size: pageSize);
});

final itemCountProvider = FutureProvider((ref) {
  final repo = ref.watch(galleryItemsRepository);

  return repo.getTotalPictureCount();
});

class GalleryItems extends ConsumerWidget {
  const GalleryItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncItemCount = ref.watch(itemCountProvider);
    return asyncItemCount.when(
      data: (count) {
        return GridView.builder(
          itemCount: count,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          itemBuilder: (context, index) {
            final pageNumber = index ~/ pageSize;
            final it = ref.watch(paginatedItemsProvider(pageNumber)).whenData(
              (value) {
                final indexOnPage = index % pageSize;
                return value[indexOnPage];
              },
            );
            return it.when(
              data: (it) => ItemTile(index: index, picture: it),
              error: ErrorPlaceholderWidget.new,
              loading: LoadingTileWidget.new,
            );
          },
        );
      },
      error: ErrorPlaceholderWidget.new,
      loading: LoadingWidget.new,
    );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key? key,
    required this.index,
    required this.picture,
  }) : super(key: key);

  final int index;
  final SamplePicture picture;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(picture.url ?? ''),
    );
  }
}
