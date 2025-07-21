import 'package:flutter/material.dart';
import 'package:payment_demo/environment/getit.dart';

abstract class AppBuilder {
  AppBuilder._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await setUpGetItConfig();
  }
}
