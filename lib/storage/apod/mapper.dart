import 'package:nasa_pictures/data/picture.dart';

import '../db.dart';

extension ApodEntryMapper on ApodEntry {
  SamplePicture toPicture() => SamplePicture(
    copyright: copyright,
    date: date,
    explanation: explanation,
    hdurl: hdurl,
    mediaType: mediaType,
    serviceVersion: serviceVersion,
    title: title,
    url: url,
  );
}
