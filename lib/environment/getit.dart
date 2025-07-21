import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:payment_demo/environment/getit.config.dart';

GetIt locator = GetIt.instance;

@injectableInit
Future<void> setUpGetItConfig() async {
  await locator.init();
}
