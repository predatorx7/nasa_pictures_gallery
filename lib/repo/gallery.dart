import 'package:nasa_pictures/configs/logging.dart';

import '../data/picture.dart';
import '../service/gallery.dart';

class GalleryInMemoryCache {
  final Map<String, List<SamplePicture>> _cache = {};

  String getKey(int start, int end) => '$start-$end';

  void add(int page, int size, List<SamplePicture> pictures) {
    final start = page * size;
    final end = start + size;
    _cache[getKey(start, end)] = pictures;
  }

  List<SamplePicture>? get(int page, int size) {
    final start = page * size;
    final end = start + size;
    return _cache[getKey(start, end)];
  }

  Future<List<SamplePicture>> run(
    int page,
    int size,
    Future<List<SamplePicture>> Function() fetch,
  ) async {
    final a = get(page, size);
    if (a != null) return a;
    final b = await fetch();
    add(page, size, b);
    return b;
  }
}

class GalleryRepository {
  final GalleryService service;
  final GalleryInMemoryCache cache;

  GalleryRepository(
    this.service,
    this.cache,
  );

  Future<List<SamplePicture>> getPictures({
    int page = 0,
    int size = 10,
  }) async {
    assert(page >= 0, 'page must be a positive integer');
    assert(size > 0, 'size should be greater than 0');

    try {
      return await cache.run(page, size, () => service.getPictures(page, size));
    } catch (e, s) {
      logging.severe(
        'Failed to get pictures of page $page and size $size',
        e,
        s,
      );
      rethrow;
    }
  }
}
