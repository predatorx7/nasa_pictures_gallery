// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SamplePicture _$SamplePictureFromJson(Map<String, dynamic> json) =>
    _SamplePicture(
      copyright: json['copyright'] as String?,
      date: json['date'] as String?,
      explanation: json['explanation'] as String?,
      hdurl: json['hdurl'] as String?,
      mediaType: json['media_type'] as String?,
      serviceVersion: json['service_version'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$SamplePictureToJson(_SamplePicture instance) =>
    <String, dynamic>{
      'copyright': instance.copyright,
      'date': instance.date,
      'explanation': instance.explanation,
      'hdurl': instance.hdurl,
      'media_type': instance.mediaType,
      'service_version': instance.serviceVersion,
      'title': instance.title,
      'url': instance.url,
    };
