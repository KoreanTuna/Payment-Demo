import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/core/util/language_util.dart';
import 'package:payment_demo/core/util/shared_pref_util.dart';
import 'package:payment_demo/environment/getit.dart';

/// Riverpod provider to handle the current language of the app.
final languageProvider =
    StateNotifierProvider<LanguageNotifier, String>((ref) => LanguageNotifier());

class LanguageNotifier extends StateNotifier<String> {
  LanguageNotifier() : super('en') {
    _init();
  }

  final SharedPrefUtil _pref = locator<SharedPrefUtil>();

  Future<void> _init() async {
    final saved = _pref.getString('language');
    state = saved ?? 'en';
    await LanguageUtil.load(state);
  }

  Future<void> setLanguage(String code) async {
    if (state == code) return;
    state = code;
    await _pref.setString(key: 'language', value: code);
    await LanguageUtil.load(code);
  }
}
