// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaginationData<T> {
  int get currentPage => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  Iterable<T>? get iterable => throw _privateConstructorUsedError;
  AsyncValue<Iterable<T>> get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationDataCopyWith<T, PaginationData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationDataCopyWith<T, $Res> {
  factory $PaginationDataCopyWith(
          PaginationData<T> value, $Res Function(PaginationData<T>) then) =
      _$PaginationDataCopyWithImpl<T, $Res, PaginationData<T>>;
  @useResult
  $Res call(
      {int currentPage,
      int limit,
      Iterable<T>? iterable,
      AsyncValue<Iterable<T>> value});
}

/// @nodoc
class _$PaginationDataCopyWithImpl<T, $Res, $Val extends PaginationData<T>>
    implements $PaginationDataCopyWith<T, $Res> {
  _$PaginationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? limit = null,
    Object? iterable = freezed,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      iterable: freezed == iterable
          ? _value.iterable
          : iterable // ignore: cast_nullable_to_non_nullable
              as Iterable<T>?,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Iterable<T>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationDataImplCopyWith<T, $Res>
    implements $PaginationDataCopyWith<T, $Res> {
  factory _$$PaginationDataImplCopyWith(_$PaginationDataImpl<T> value,
          $Res Function(_$PaginationDataImpl<T>) then) =
      __$$PaginationDataImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {int currentPage,
      int limit,
      Iterable<T>? iterable,
      AsyncValue<Iterable<T>> value});
}

/// @nodoc
class __$$PaginationDataImplCopyWithImpl<T, $Res>
    extends _$PaginationDataCopyWithImpl<T, $Res, _$PaginationDataImpl<T>>
    implements _$$PaginationDataImplCopyWith<T, $Res> {
  __$$PaginationDataImplCopyWithImpl(_$PaginationDataImpl<T> _value,
      $Res Function(_$PaginationDataImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? limit = null,
    Object? iterable = freezed,
    Object? value = null,
  }) {
    return _then(_$PaginationDataImpl<T>(
      null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == iterable
          ? _value.iterable
          : iterable // ignore: cast_nullable_to_non_nullable
              as Iterable<T>?,
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Iterable<T>>,
    ));
  }
}

/// @nodoc

class _$PaginationDataImpl<T> extends _PaginationData<T> {
  const _$PaginationDataImpl(
      this.currentPage, this.limit, this.iterable, this.value)
      : super._();

  @override
  final int currentPage;
  @override
  final int limit;
  @override
  final Iterable<T>? iterable;
  @override
  final AsyncValue<Iterable<T>> value;

  @override
  String toString() {
    return 'PaginationData<$T>(currentPage: $currentPage, limit: $limit, iterable: $iterable, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationDataImpl<T> &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            const DeepCollectionEquality().equals(other.iterable, iterable) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPage, limit,
      const DeepCollectionEquality().hash(iterable), value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationDataImplCopyWith<T, _$PaginationDataImpl<T>> get copyWith =>
      __$$PaginationDataImplCopyWithImpl<T, _$PaginationDataImpl<T>>(
          this, _$identity);
}

abstract class _PaginationData<T> extends PaginationData<T> {
  const factory _PaginationData(
      final int currentPage,
      final int limit,
      final Iterable<T>? iterable,
      final AsyncValue<Iterable<T>> value) = _$PaginationDataImpl<T>;
  const _PaginationData._() : super._();

  @override
  int get currentPage;
  @override
  int get limit;
  @override
  Iterable<T>? get iterable;
  @override
  AsyncValue<Iterable<T>> get value;
  @override
  @JsonKey(ignore: true)
  _$$PaginationDataImplCopyWith<T, _$PaginationDataImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
