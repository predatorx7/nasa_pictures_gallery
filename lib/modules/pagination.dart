import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_pictures/configs/logging.dart';

import '../data/pagination.dart';

typedef OnFetchCallback<T> = Future<Iterable<T>> Function(
  int currentPage,
  int limit,
);

class PaginatedDataController<T> extends StateNotifier<PaginationData<T>> {
  PaginatedDataController({
    required this.fetch,
    int initialPage = 0,
    this.limit = 20,
    this.loadThreshold = 200,
  }) : super(PaginationData<T>(
          initialPage - 1,
          limit,
          null,
          const AsyncValue.loading(),
        )) {
    requestFetch();
  }

  final Future<Iterable<T>> Function(
    int currentPage,
    int limit,
  ) fetch;
  final int limit;
  final double loadThreshold;

  bool onScrollUpdate(ScrollUpdateNotification notification) {
    final extentAfter = notification.metrics.extentAfter;
    if (extentAfter <= loadThreshold && state.nextAvailable) {
      load();
    }
    return true;
  }

  Completer? _completer;

  Future<void> requestFetch() {
    if (state.nextAvailable) {
      return load();
    }
    return Future.value();
  }

  @protected
  Future<void> load() async {
    if (_completer == null || _completer!.isCompleted) {
      _completer = Completer();
      _loadData().then((value) {
        _completer?.complete();
      });
    }

    return _completer!.future;
  }

  Future<void> _loadData() async {
    assert(state.nextAvailable);
    try {
      await Future.delayed(const Duration(milliseconds: 800));

      final nextPage = state.currentPage + 1;
      final data = await fetch(nextPage, state.limit);

      final newValues = List<T>.unmodifiable([
        ...?state.iterable,
        ...data,
      ]);

      final asyncValue = AsyncValue<Iterable<T>>.data(newValues);

      state = state.copyWith(
        currentPage: nextPage,
        iterable: newValues,
        value: asyncValue,
      );
    } catch (e, s) {
      final asyncValue = AsyncValue<Iterable<T>>.error(e, stackTrace: s);
      if (mounted) {
        state = state.copyWith(value: asyncValue);
      } else {
        logging('PaginatedDataController._loadData').warning(
          'State was attempted to set when the StateNotifier was not mounted',
        );
      }
    }
  }
}
