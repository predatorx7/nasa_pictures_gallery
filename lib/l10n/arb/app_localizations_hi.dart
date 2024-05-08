import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'NASA Pictures';

  @override
  String get languageName => 'Hindi';

  @override
  String get languageId => '3';

  @override
  String get selectLanguage => 'Select a Language';

  @override
  String get termsConditions => 'Terms & Conditions';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get appLanguage => 'Application language';

  @override
  String get purchases => 'Purchases';

  @override
  String get upcomingOrders => 'Upcoming orders';

  @override
  String get purchaseHistory => 'Purchase History';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get faq => 'FAQ';

  @override
  String get logout => 'Logout';

  @override
  String get explore => 'Browse Pictures';

  @override
  String get proceedToBuy => 'Proceed to Buy';

  @override
  String nItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
      zero: 'no item',
    );
    return '$_temp0';
  }

  @override
  String get searchPictures => 'Search pictures..';

  @override
  String get noPictures => 'No pictures available..';

  @override
  String get noResults => 'No results found..';
}
