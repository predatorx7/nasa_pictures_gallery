import 'dart:convert' show json;

import 'package:flutter/foundation.dart';

dynamic parseAndDecode(String? response) {
  if (response?.isNotEmpty != true) {
    return null;
  }
  return json.decode(response!);
}

dynamic _parseAndDecode(String response) {
  return json.decode(response);
}

dynamic parseJsonInIsolate(String text) {
  return compute(_parseAndDecode, text);
}
