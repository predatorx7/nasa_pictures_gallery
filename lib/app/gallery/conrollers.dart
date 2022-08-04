import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/pagination.dart';
import '../../data/picture.dart';
import '../../modules/gallery.dart';
import '../../modules/pagination.dart';
import '../../modules/search.dart';

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
