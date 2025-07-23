import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'base_loading_provider.g.dart';

@Riverpod(keepAlive: true)
class BaseLoading extends _$BaseLoading {
  @override
  bool build() {
    return false;
  }

  void setLoading() {
    state = true;
  }

  void reset() {
    state = false;
  }
}
