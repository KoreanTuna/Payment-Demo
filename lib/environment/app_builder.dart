import 'package:payment_demo/environment/getit.dart';

abstract class AppBuilder {
  AppBuilder._();

  static Future<void> init() async {
    await setUpGetItConfig();
  }
}
