// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SamplePicture {

 String? get copyright; String? get date; String? get explanation; String? get hdurl;@JsonKey(name: 'media_type') String? get mediaType;@JsonKey(name: 'service_version') String? get serviceVersion; String? get title; String? get url;
/// Create a copy of SamplePicture
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SamplePictureCopyWith<SamplePicture> get copyWith => _$SamplePictureCopyWithImpl<SamplePicture>(this as SamplePicture, _$identity);

  /// Serializes this SamplePicture to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SamplePicture&&(identical(other.copyright, copyright) || other.copyright == copyright)&&(identical(other.date, date) || other.date == date)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.hdurl, hdurl) || other.hdurl == hdurl)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.serviceVersion, serviceVersion) || other.serviceVersion == serviceVersion)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,copyright,date,explanation,hdurl,mediaType,serviceVersion,title,url);

@override
String toString() {
  return 'SamplePicture(copyright: $copyright, date: $date, explanation: $explanation, hdurl: $hdurl, mediaType: $mediaType, serviceVersion: $serviceVersion, title: $title, url: $url)';
}


}

/// @nodoc
abstract mixin class $SamplePictureCopyWith<$Res>  {
  factory $SamplePictureCopyWith(SamplePicture value, $Res Function(SamplePicture) _then) = _$SamplePictureCopyWithImpl;
@useResult
$Res call({
 String? copyright, String? date, String? explanation, String? hdurl,@JsonKey(name: 'media_type') String? mediaType,@JsonKey(name: 'service_version') String? serviceVersion, String? title, String? url
});




}
/// @nodoc
class _$SamplePictureCopyWithImpl<$Res>
    implements $SamplePictureCopyWith<$Res> {
  _$SamplePictureCopyWithImpl(this._self, this._then);

  final SamplePicture _self;
  final $Res Function(SamplePicture) _then;

/// Create a copy of SamplePicture
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? copyright = freezed,Object? date = freezed,Object? explanation = freezed,Object? hdurl = freezed,Object? mediaType = freezed,Object? serviceVersion = freezed,Object? title = freezed,Object? url = freezed,}) {
  return _then(SamplePicture(
copyright: freezed == copyright ? _self.copyright : copyright // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,hdurl: freezed == hdurl ? _self.hdurl : hdurl // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,serviceVersion: freezed == serviceVersion ? _self.serviceVersion : serviceVersion // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SamplePicture].
extension SamplePicturePatterns on SamplePicture {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SamplePicture value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SamplePicture() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SamplePicture value)  $default,){
final _that = this;
switch (_that) {
case _SamplePicture():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SamplePicture value)?  $default,){
final _that = this;
switch (_that) {
case _SamplePicture() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? copyright,  String? date,  String? explanation,  String? hdurl, @JsonKey(name: 'media_type')  String? mediaType, @JsonKey(name: 'service_version')  String? serviceVersion,  String? title,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SamplePicture() when $default != null:
return $default(_that.copyright,_that.date,_that.explanation,_that.hdurl,_that.mediaType,_that.serviceVersion,_that.title,_that.url);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? copyright,  String? date,  String? explanation,  String? hdurl, @JsonKey(name: 'media_type')  String? mediaType, @JsonKey(name: 'service_version')  String? serviceVersion,  String? title,  String? url)  $default,) {final _that = this;
switch (_that) {
case _SamplePicture():
return $default(_that.copyright,_that.date,_that.explanation,_that.hdurl,_that.mediaType,_that.serviceVersion,_that.title,_that.url);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? copyright,  String? date,  String? explanation,  String? hdurl, @JsonKey(name: 'media_type')  String? mediaType, @JsonKey(name: 'service_version')  String? serviceVersion,  String? title,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _SamplePicture() when $default != null:
return $default(_that.copyright,_that.date,_that.explanation,_that.hdurl,_that.mediaType,_that.serviceVersion,_that.title,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SamplePicture implements SamplePicture {
  const _SamplePicture({this.copyright, this.date, this.explanation, this.hdurl, @JsonKey(name: 'media_type') this.mediaType, @JsonKey(name: 'service_version') this.serviceVersion, this.title, this.url});
  factory _SamplePicture.fromJson(Map<String, dynamic> json) => _$SamplePictureFromJson(json);

@override final  String? copyright;
@override final  String? date;
@override final  String? explanation;
@override final  String? hdurl;
@override@JsonKey(name: 'media_type') final  String? mediaType;
@override@JsonKey(name: 'service_version') final  String? serviceVersion;
@override final  String? title;
@override final  String? url;

/// Create a copy of SamplePicture
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SamplePictureCopyWith<_SamplePicture> get copyWith => __$SamplePictureCopyWithImpl<_SamplePicture>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SamplePictureToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SamplePicture&&(identical(other.copyright, copyright) || other.copyright == copyright)&&(identical(other.date, date) || other.date == date)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.hdurl, hdurl) || other.hdurl == hdurl)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.serviceVersion, serviceVersion) || other.serviceVersion == serviceVersion)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,copyright,date,explanation,hdurl,mediaType,serviceVersion,title,url);

@override
String toString() {
  return 'SamplePicture(copyright: $copyright, date: $date, explanation: $explanation, hdurl: $hdurl, mediaType: $mediaType, serviceVersion: $serviceVersion, title: $title, url: $url)';
}


}

/// @nodoc
abstract mixin class _$SamplePictureCopyWith<$Res> implements $SamplePictureCopyWith<$Res> {
  factory _$SamplePictureCopyWith(_SamplePicture value, $Res Function(_SamplePicture) _then) = __$SamplePictureCopyWithImpl;
@override @useResult
$Res call({
 String? copyright, String? date, String? explanation, String? hdurl,@JsonKey(name: 'media_type') String? mediaType,@JsonKey(name: 'service_version') String? serviceVersion, String? title, String? url
});




}
/// @nodoc
class __$SamplePictureCopyWithImpl<$Res>
    implements _$SamplePictureCopyWith<$Res> {
  __$SamplePictureCopyWithImpl(this._self, this._then);

  final _SamplePicture _self;
  final $Res Function(_SamplePicture) _then;

/// Create a copy of SamplePicture
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? copyright = freezed,Object? date = freezed,Object? explanation = freezed,Object? hdurl = freezed,Object? mediaType = freezed,Object? serviceVersion = freezed,Object? title = freezed,Object? url = freezed,}) {
  return _then(_SamplePicture(
copyright: freezed == copyright ? _self.copyright : copyright // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,hdurl: freezed == hdurl ? _self.hdurl : hdurl // ignore: cast_nullable_to_non_nullable
as String?,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,serviceVersion: freezed == serviceVersion ? _self.serviceVersion : serviceVersion // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
