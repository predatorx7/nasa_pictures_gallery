import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';

@freezed
class PaginationData<T> with _$PaginationData<T> {
  const PaginationData._();

  const factory PaginationData(
    int currentPage,
    int limit,
    Iterable<T>? iterable,
    AsyncValue<Iterable<T>> value,
  ) = _PaginationData<T>;

  int? get length => iterable?.length;

  bool get nextAvailable {
    final len = length;
    return (len == null) || ((len % limit) == 0);
  }
}
