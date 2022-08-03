import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_pictures/repo/gallery.dart';
import 'package:nasa_pictures/service/gallery.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('For the Gallery Repository', () {
    late GalleryRepository repository;

    setUp(() {
      repository = GalleryRepository(GalleryService(), GalleryInMemoryCache());
    });

    test('equality of values returned from same query multiple times',
        () async {
      const page1 = 0;
      const size1 = 10;
      final a1 = await repository.getPictures(
        page: page1,
        size: size1,
      );
      final a2 = await repository.getPictures(
        page: page1,
        size: size1,
      );
      expect(a1, a2);
      final b1 = await repository.getPictures(
        page: page1 + 1,
        size: size1,
      );
      expect(a1, isNot(b1));
    });

    test('illegal arguments', () async {
      expect(
        () => repository.getPictures(
          page: -1,
          size: 10,
        ),
        throwsAssertionError,
      );

      expect(
        () => repository.getPictures(
          page: 0,
          size: -10,
        ),
        throwsAssertionError,
      );

      expect(
        () => repository.getPictures(
          page: 0,
          size: 10,
        ),
        returnsNormally,
      );
    });
  });
}
