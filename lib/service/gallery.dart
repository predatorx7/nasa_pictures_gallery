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

    const int lowerLimit = 0;
    final int upperLimit = total;

    int limited(int value) {
      return value.clamp(lowerLimit, upperLimit);
    }

    return _rawData
        .sublist(limited(start), limited(end))
        .map<SamplePicture>((json) {
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
