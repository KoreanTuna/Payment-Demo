import 'dart:convert';

import 'package:flutter/services.dart';

/// A simple utility to load and retrieve localized strings from JSON files.
class LanguageUtil {
  LanguageUtil._();

  static Map<String, dynamic> _localizedStrings = {};

  /// Load language JSON from assets. Expected files are placed under
  /// `assets/lang/` directory.
  static Future<void> load(String languageCode) async {
    final jsonString =
        await rootBundle.loadString('assets/lang/' + languageCode + '.json');
    _localizedStrings = json.decode(jsonString) as Map<String, dynamic>;
  }

  /// Get the translated string for [key]. If the key doesn't exist, the key
  /// itself is returned.
  static String getString(String key) {
    return _localizedStrings[key] ?? key;
  }
}
