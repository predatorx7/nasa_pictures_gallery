import 'package:flutter/services.dart';
import 'package:nasa_pictures/data/picture.dart';
import 'package:nasa_pictures/gen/assets.gen.dart';

import '../utils/compute/json_decode.dart';

class GalleryService {
  Future<List<SamplePicture>> getPictures(int page, int size) async {
    final start = page * size;
    final end = start + size;
    final _rawData = await getRawData();
    return _rawData.sublist(start, end).map((json) {
      return SamplePicture.fromJson(json);
    }).toList();
  }

  Future<dynamic> getRawData() async {
    final nasaGalleryRawTextData = await rootBundle.loadString(
      Assets.data.data,
    );
    return parseJsonInIsolate(nasaGalleryRawTextData);
  }
}
