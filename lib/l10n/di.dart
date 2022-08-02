import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../storage/locale/locale.dart';
import 'l10n.dart';

final localeControllerProvider =
    StateNotifierProvider<LocaleController, Locale?>((ref) {
  final localePreference = ref.watch(localePreferenceProvider);
  final savedLocale = ref.watch(savedLocaleProvider.select(
    (value) {
      return (value is AsyncData || value is AsyncLoading) ? value.value : null;
    },
  ));

  return LocaleController(localePreference, savedLocale);
});

final localePreferenceProvider = Provider((ref) {
  return LocalePreference();
});

final savedLocaleProvider = FutureProvider((ref) {
  return ref.watch(localePreferenceProvider).getLocale();
});
