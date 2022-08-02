import 'package:json_annotation/json_annotation.dart';

part 'picture.g.dart';

@JsonSerializable()
class SamplePicture {
  @JsonKey(name: 'copyright')
  final String? copyright;
  @JsonKey(name: 'date')
  final String? date;
  @JsonKey(name: 'explanation')
  final String? explanation;
  @JsonKey(name: 'hdurl')
  final String? hdurl;
  @JsonKey(name: 'media_type')
  final String? mediaType;
  @JsonKey(name: 'service_version')
  final String? serviceVersion;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'url')
  final String? url;

  const SamplePicture(
    this.copyright,
    this.date,
    this.explanation,
    this.hdurl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
  );

  factory SamplePicture.fromJson(Map<String, dynamic> json) =>
      _$SamplePictureFromJson(json);

  Map<String, dynamic> toJson() => _$SamplePictureToJson(this);
}
