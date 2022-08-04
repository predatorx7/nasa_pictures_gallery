import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

String? neatlyFormatDate(
  BuildContext context,
  String? value,
) {
  if (value == null) return null;
  final locale = Localizations.localeOf(context);

  final reversedDateFormat = DateFormat("yyyy-MM-dd", locale.toString());
  final dateLabelFormat = DateFormat("dd MMM, yyyy", locale.toString());

  return dateLabelFormat.format(
    reversedDateFormat.parse(value),
  );
}
