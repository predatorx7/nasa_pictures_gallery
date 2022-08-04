// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$PaginationDataCopyWithImpl<T, $Res>;
  $Res call(
      {int currentPage,
      int limit,
      Iterable<T>? iterable,
      AsyncValue<Iterable<T>> value});
}

/// @nodoc
class _$PaginationDataCopyWithImpl<T, $Res>
    implements $PaginationDataCopyWith<T, $Res> {
  _$PaginationDataCopyWithImpl(this._value, this._then);

  final PaginationData<T> _value;
  // ignore: unused_field
  final $Res Function(PaginationData<T>) _then;

  @override
  $Res call({
    Object? currentPage = freezed,
    Object? limit = freezed,
    Object? iterable = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      iterable: iterable == freezed
          ? _value.iterable
          : iterable // ignore: cast_nullable_to_non_nullable
              as Iterable<T>?,
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Iterable<T>>,
    ));
  }
}

/// @nodoc
abstract class _$$_PaginationDataCopyWith<T, $Res>
    implements $PaginationDataCopyWith<T, $Res> {
  factory _$$_PaginationDataCopyWith(_$_PaginationData<T> value,
          $Res Function(_$_PaginationData<T>) then) =
      __$$_PaginationDataCopyWithImpl<T, $Res>;
  @override
  $Res call(
      {int currentPage,
      int limit,
      Iterable<T>? iterable,
      AsyncValue<Iterable<T>> value});
}

/// @nodoc
class __$$_PaginationDataCopyWithImpl<T, $Res>
    extends _$PaginationDataCopyWithImpl<T, $Res>
    implements _$$_PaginationDataCopyWith<T, $Res> {
  __$$_PaginationDataCopyWithImpl(
      _$_PaginationData<T> _value, $Res Function(_$_PaginationData<T>) _then)
      : super(_value, (v) => _then(v as _$_PaginationData<T>));

  @override
  _$_PaginationData<T> get _value => super._value as _$_PaginationData<T>;

  @override
  $Res call({
    Object? currentPage = freezed,
    Object? limit = freezed,
    Object? iterable = freezed,
    Object? value = freezed,
  }) {
    return _then(_$_PaginationData<T>(
      currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      iterable == freezed
          ? _value.iterable
          : iterable // ignore: cast_nullable_to_non_nullable
              as Iterable<T>?,
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as AsyncValue<Iterable<T>>,
    ));
  }
}

/// @nodoc

class _$_PaginationData<T> extends _PaginationData<T> {
  const _$_PaginationData(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationData<T> &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality().equals(other.iterable, iterable) &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(iterable),
      const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_PaginationDataCopyWith<T, _$_PaginationData<T>> get copyWith =>
      __$$_PaginationDataCopyWithImpl<T, _$_PaginationData<T>>(
          this, _$identity);
}

abstract class _PaginationData<T> extends PaginationData<T> {
  const factory _PaginationData(
      final int currentPage,
      final int limit,
      final Iterable<T>? iterable,
      final AsyncValue<Iterable<T>> value) = _$_PaginationData<T>;
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
  _$$_PaginationDataCopyWith<T, _$_PaginationData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
