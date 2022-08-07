import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'picture.g.dart';

@JsonSerializable()
class SamplePicture with EquatableMixin {
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

  static List<SamplePicture> fromJsonList(Iterable<dynamic> data) =>
      data.map<SamplePicture>((json) {
        return SamplePicture.fromJson(json);
      }).toList();

  Map<String, dynamic> toJson() => _$SamplePictureToJson(this);

  @override
  List<Object?> get props => [
        copyright,
        date,
        hdurl,
        mediaType,
        serviceVersion,
        title,
        url,
      ];
}
