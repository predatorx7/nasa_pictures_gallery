import 'package:flutter/services.dart';
import 'package:nasa_pictures/data/picture.dart';
import 'package:nasa_pictures/gen/assets.gen.dart';

import '../utils/compute/json_decode.dart';

class GalleryService {
  Future<List<SamplePicture>> getPictures(int page, int size) async {
    final start = page * size;
    final end = start + size;
    final _rawData = await getRawData();

    final total = _rawData.length;

    if (start >= total || end > total || start < 0 || end < 0) {
      return <SamplePicture>[];
    }

    return _rawData.sublist(start, end).map<SamplePicture>((json) {
      return SamplePicture.fromJson(json);
    }).toList();
  }

  Future<int> getTotalPictureCount() {
    return getRawData().then((data) {
      return data.length;
    });
  }

  Future<dynamic> getRawData() async {
    final nasaGalleryRawTextData = await rootBundle.loadString(
      Assets.data.data,
    );
    return parseJsonInIsolate(nasaGalleryRawTextData);
  }
}
