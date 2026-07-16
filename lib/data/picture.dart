import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture.freezed.dart';
part 'picture.g.dart';

@freezed
abstract class SamplePicture with _$SamplePicture {
  const factory SamplePicture({
    String? copyright,
    String? date,
    String? explanation,
    String? hdurl,
    @JsonKey(name: 'media_type') String? mediaType,
    @JsonKey(name: 'service_version') String? serviceVersion,
    String? title,
    String? url,
  }) = _SamplePicture;

  factory SamplePicture.fromJson(Map<String, dynamic> json) =>
      _$SamplePictureFromJson(json);

  static List<SamplePicture> fromJsonList(Iterable<dynamic> data) =>
      data.map<SamplePicture>((json) {
        return SamplePicture.fromJson(json);
      }).toList();
}
