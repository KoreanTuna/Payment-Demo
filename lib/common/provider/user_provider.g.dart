// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(User)
const userProvider = UserProvider._();

final class UserProvider extends $NotifierProvider<User, UserEntity> {
  const UserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userHash();

  @$internal
  @override
  User create() => User();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserEntity>(value),
    );
  }
}

String _$userHash() => r'3a7458bd6d8c5f1486a470831832992486b0a92c';

abstract class _$User extends $Notifier<UserEntity> {
  UserEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UserEntity, UserEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserEntity, UserEntity>,
              UserEntity,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
