import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'en_US.dart';
import 'ar_AR.dart';

class TranslationService extends Translations {
  static Locale? get locale => Locale('en', 'US');
  static final fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'ar_AR': ar_AR,
      };
}
