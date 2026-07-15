import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';

@freezed
class PaginationData<T> with _$PaginationData<T> {
  const PaginationData({
    required this.currentPage,
    required this.limit,
    this.iterable,
    required this.value,
  });

  @override
  final AsyncValue<Iterable<T>> value;
  @override
  final int currentPage;
  @override
  final int limit;
  @override
  final Iterable<T>? iterable;

  int? get length => iterable?.length;

  bool get nextAvailable {
    final len = length;
    return (len == null) || ((len % limit) == 0);
  }
}
