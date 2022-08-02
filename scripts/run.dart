// ignore_for_file: avoid_print

import 'dart:convert';

import 'camelcase.dart';

final Map<String, String> x = {};

void main() {
  final Map<String, String> y = {};
  for (final i in x.entries) {
    final name = lowerCamelCase(i.key);
    y[name] = i.value;
  }
  final z = json.encode(y);
  print(z);
}
