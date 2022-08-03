import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_pictures/data/picture.dart';
import 'package:nasa_pictures/repo/gallery.dart';

void main() {
  group('Test for in-memory cache of gallery service', () {
    late GalleryInMemoryCache cache;

    setUp(() {
      cache = GalleryInMemoryCache();
    });

    test('key generation', () {
      const start = 0;
      const end = 10;

      expect(cache.getKey(start, end), '$start-$end');
    });

    test('addition of data', () {
      const start = 0;
      final samples = getSampleValues(start, 10);

      const page = start;
      final end = samples.length;
      final size = end;

      expect(cache.get(page, size), isNull);

      cache.add(start, end, samples);

      expect(cache.get(page, size), isNotNull);

      expect(cache.get(page, size), isNotEmpty);

      expect(cache.get(page, size), same(samples));
    });

    test('get cached values', () async {
      const page = 0;
      const size = 10;
      final sample1 = getSampleValues(page, size);

      final value1a = await cache.run(
        page,
        size,
        () => Future.value(
          sample1,
        ),
      );

      final value1b = await cache.run(
        page,
        size,
        () => Future.value(
          sample1,
        ),
      );

      expect(value1a, isNotEmpty);
      expect(value1a, same(value1b));
      expect(value1a, same(sample1));

      final sample2 = getSampleValues(page + 1, size);

      expect(sample1, isNot(same(sample2)));

      final value2a = await cache.run(
        page,
        size,
        () => Future.value(
          sample2,
        ),
      );

      expect(
        sample2,
        isNot(same(value2a)),
        reason: 'Old values must be cached so this must be different',
      );

      final value2b = await cache.run(
        page + 1,
        size,
        () => Future.value(
          sample2,
        ),
      );

      expect(
        sample2,
        same(value2b),
      );
    });
  });
}

List<SamplePicture> getSampleValues(int start, int size) {
  return List.generate(size, (i) {
    final it = ((start * size) + i).toString();
    return SamplePicture(it, it, it, it, it, it, it, it);
  });
}
