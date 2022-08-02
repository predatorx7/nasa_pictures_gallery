import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../storage/locale/locale.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

class LocaleController extends StateNotifier<Locale?> {
  LocaleController(this._localePreference, Locale? locale) : super(locale);

  final LocalePreference _localePreference;

  /// Please ensure that [resolveLegacyLocale] is called after the locale dependencies update in the context.
  Future<void> update(Locale? locale) async {
    state = locale;
    if (locale == null) {
      _localePreference.delete();
    } else {
      _localePreference.saveLocale(locale);
    }
  }

  static List<Locale> supportedLocales() {
    return AppLocalizations.supportedLocales;
  }

  static bool isSupportedLocale(Locale locale) {
    return supportedLocales().contains(locale);
  }

  static AppLocalizations l10n(BuildContext context) {
    return AppLocalizations.of(context);
  }

  static String currentLanguageName(BuildContext context) {
    return l10n(context).languageName;
  }

  static String currentLanguageId(BuildContext context) {
    return l10n(context).languageId;
  }

  static AppLocalizations? localizationFor(Locale locale) {
    if (!isSupportedLocale(locale)) return null;

    return lookupAppLocalizations(locale);
  }

  static String languageNameFor(Locale locale) {
    return localizationFor(locale)?.languageName ?? locale.toString();
  }

  static String languageIdFor(Locale locale) {
    return localizationFor(locale)?.languageId ?? '';
  }
}
