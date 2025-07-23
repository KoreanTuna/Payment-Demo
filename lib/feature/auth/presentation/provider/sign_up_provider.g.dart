// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(SignUp)
const signUpProvider = SignUpProvider._();

final class SignUpProvider extends $NotifierProvider<SignUp, SignUpFormEntity> {
  const SignUpProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signUpProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signUpHash();

  @$internal
  @override
  SignUp create() => SignUp();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignUpFormEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignUpFormEntity>(value),
    );
  }
}

String _$signUpHash() => r'e3cf3fd7fa52d0083fdb5f940730e24be64d20ac';

abstract class _$SignUp extends $Notifier<SignUpFormEntity> {
  SignUpFormEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SignUpFormEntity, SignUpFormEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SignUpFormEntity, SignUpFormEntity>,
              SignUpFormEntity,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
