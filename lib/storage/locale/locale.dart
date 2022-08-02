import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class LocalePreference {
  static const String _preferencesKeyId = 'locale_preference';
  static const String _languageCodeKey = '$_preferencesKeyId/language_code';
  static const String _countryCodeKey = '$_preferencesKeyId/country_code';

  Future<void> saveLocale(Locale locale) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_languageCodeKey, locale.languageCode);
    final countryCode = locale.countryCode;
    if (countryCode != null) {
      await preferences.setString(_countryCodeKey, countryCode);
    }
  }

  Future<void> delete() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_languageCodeKey);
    await preferences.remove(_countryCodeKey);
  }

  Future<Locale?> getLocale() async {
    final preferences = await SharedPreferences.getInstance();
    final languageCode = preferences.getString(_languageCodeKey);
    final countryCode = preferences.getString(_countryCodeKey);
    if (languageCode == null || languageCode.isEmpty) return null;

    return Locale(languageCode, countryCode);
  }
}
