import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;
import 'package:nasa_pictures/data/picture.dart';

class GalleryService {
  GalleryService({http.Client? client, this.apiKey = _defaultApiKey})
    : _client = client ?? http.Client();

  /// NASA APOD API key. Override via `--dart-define=NASA_API_KEY=...`.
  /// Falls back to NASA's public DEMO_KEY (heavily rate-limited).
  static const _defaultApiKey = String.fromEnvironment(
    'NASA_API_KEY',
    defaultValue: 'DEMO_KEY',
  );

  static const _apodHost = 'api.nasa.gov';
  static const _apodPath = '/planetary/apod';

  final http.Client _client;
  final String apiKey;

  /// Fetches APOD entries for the inclusive date range [start, end] directly
  /// from the network. Callers are responsible for caching the result.
  Future<List<SamplePicture>> fetchRange(DateTime start, DateTime end) async {
    final uri = Uri.https(_apodHost, _apodPath, {
      'api_key': apiKey,
      'start_date': _formatDate(start),
      'end_date': _formatDate(end),
    });

    final response = await _client.get(uri);

    if (response.statusCode != 200) {
      throw http.ClientException(
        'APOD API returned ${response.statusCode}: ${response.body}',
        uri,
      );
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! List) {
      throw const FormatException('APOD API did not return a list');
    }

    // Only keep image entries; APOD also serves videos which the gallery
    // cannot render.
    return decoded
        .whereType<Map<String, dynamic>>()
        .where((e) => e['media_type'] == 'image')
        .map(SamplePicture.fromJson)
        .toList();
  }

  static String _formatDate(DateTime date) {
    final format = intl.DateFormat('yyyy-MM-dd');
    return format.format(date);
  }
}
