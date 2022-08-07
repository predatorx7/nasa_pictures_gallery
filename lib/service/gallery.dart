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

    _rawData.sort(compareByDate);

    return SamplePicture.fromJsonList(
      _rawData.sublist(limited(start), limited(end)),
    );
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

  static int compareByDate(a, b) {
    final as = a['date'];
    final bs = b['date'];
    if (as is! String && bs is! String) return 0;
    if (as is! String) return -1;
    if (bs is! String) return 1;
    return as.compareTo(bs) * -1;
  }
}
