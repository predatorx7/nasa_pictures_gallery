import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:nasa_pictures/service/gallery.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('GalleryService.fetchRange', () {
    test('decodes image entries and skips videos', () async {
      final client = MockClient((request) async {
        return http.Response(
          jsonEncode([
            {
              'date': '2020-01-01',
              'title': 'Image day',
              'media_type': 'image',
              'url': 'https://example.com/1.jpg',
            },
            {
              'date': '2020-01-02',
              'title': 'Video day',
              'media_type': 'video',
              'url': 'https://example.com/2.mp4',
            },
          ]),
          200,
        );
      });

      final service = GalleryService(client: client);
      final result = await service.fetchRange(
        DateTime(2020, 1, 1),
        DateTime(2020, 1, 2),
      );

      expect(result, hasLength(1));
      expect(result.single.date, '2020-01-01');
      expect(result.single.mediaType, 'image');
    });

    test('sends month-day formatted date params (regression for yyyy-mm-dd bug)', () async {
      late Uri requestedUri;
      final client = MockClient((request) async {
        requestedUri = request.url;
        return http.Response(jsonEncode([]), 200);
      });

      final service = GalleryService(client: client);
      await service.fetchRange(DateTime(2024, 3, 5), DateTime(2024, 3, 9));

      expect(requestedUri.queryParameters['start_date'], '2024-03-05');
      expect(requestedUri.queryParameters['end_date'], '2024-03-09');
    });

    test('throws on non-200 response', () async {
      final client = MockClient(
        (request) async => http.Response('error', 500),
      );
      final service = GalleryService(client: client);

      expect(
        () => service.fetchRange(DateTime(2024, 1, 1), DateTime(2024, 1, 2)),
        throwsA(isA<http.ClientException>()),
      );
    });

    test('throws FormatException when response is not a list', () async {
      final client = MockClient(
        (request) async => http.Response(jsonEncode({'error': 'nope'}), 200),
      );
      final service = GalleryService(client: client);

      expect(
        () => service.fetchRange(DateTime(2024, 1, 1), DateTime(2024, 1, 2)),
        throwsA(isA<FormatException>()),
      );
    });

    test('returns an empty list when no entries are in range', () async {
      final client = MockClient(
        (request) async => http.Response(jsonEncode([]), 200),
      );
      final service = GalleryService(client: client);

      final result = await service.fetchRange(
        DateTime(2024, 1, 1),
        DateTime(2024, 1, 2),
      );

      expect(result, isEmpty);
    });
  });
}
