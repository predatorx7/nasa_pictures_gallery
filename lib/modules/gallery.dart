import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_pictures/repo/gallery.dart';
import 'package:nasa_pictures/service/gallery.dart';

final galleryCacheProvider = Provider((ref) {
  return GalleryInMemoryCache();
});

final galleryServiceProvider = Provider((ref) {
  return GalleryService();
});

final galleryItemsRepository = Provider((ref) {
  return GalleryRepository(
    ref.watch(galleryServiceProvider),
    ref.watch(galleryCacheProvider),
  );
});
