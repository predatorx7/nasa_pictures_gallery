// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SamplePicture _$SamplePictureFromJson(Map<String, dynamic> json) =>
    SamplePicture(
      json['copyright'] as String?,
      json['date'] as String?,
      json['explanation'] as String?,
      json['hdurl'] as String?,
      json['media_type'] as String?,
      json['service_version'] as String?,
      json['title'] as String?,
      json['url'] as String?,
    );

Map<String, dynamic> _$SamplePictureToJson(SamplePicture instance) =>
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
