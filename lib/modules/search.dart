import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nasa_pictures/data/picture.dart';

class SearchQueryProvider extends StateNotifier<String?> {
  SearchQueryProvider([
    this._debounceDuration = const Duration(milliseconds: 500),
  ]) : super(null);

  final Duration _debounceDuration;
  Timer? _debounce;

  void onTextChanged(String value) {
    if (value.trim().isEmpty) {
      state = null;
      return;
    }

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(_debounceDuration, () {
      state = value;
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}

final browsingSearchQueryProvider =
    StateNotifierProvider<SearchQueryProvider, String?>(
  (ref) {
    return SearchQueryProvider();
  },
);

final isSearchedAttemptedProvider = Provider((ref) {
  final query = ref.watch(browsingSearchQueryProvider);
  return query != null;
});
