import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_pictures/repo/gallery.dart';
import 'package:nasa_pictures/service/gallery.dart';

final galleryCache = Provider((ref) {
  return GalleryInMemoryCache();
});

final galleryItemsRepository = Provider((ref) {
  return GalleryRepository(GalleryService(), ref.watch(galleryCache));
});
