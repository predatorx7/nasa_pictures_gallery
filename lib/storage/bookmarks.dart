import 'package:nasa_pictures/data/picture.dart';

abstract class BookmarkStorageService {
  Future<bool> isBookmarked(String date);
  Future<SamplePicture> getBy(String date);
  Future<bool> save(SamplePicture image);
  Future<bool> deleteBy(String date);
}
