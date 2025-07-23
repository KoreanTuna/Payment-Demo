// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_loading_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(BaseLoading)
const baseLoadingProvider = BaseLoadingProvider._();

final class BaseLoadingProvider extends $NotifierProvider<BaseLoading, bool> {
  const BaseLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'baseLoadingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$baseLoadingHash();

  @$internal
  @override
  BaseLoading create() => BaseLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$baseLoadingHash() => r'83ba2b20ae0a736bea918bf4c9b84ad27974ab4e';

abstract class _$BaseLoading extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
