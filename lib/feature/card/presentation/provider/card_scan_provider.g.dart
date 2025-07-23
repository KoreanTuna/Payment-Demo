// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_scan_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(CardScan)
const cardScanProvider = CardScanProvider._();

final class CardScanProvider
    extends $NotifierProvider<CardScan, CardScanEntity> {
  const CardScanProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cardScanProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cardScanHash();

  @$internal
  @override
  CardScan create() => CardScan();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CardScanEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CardScanEntity>(value),
    );
  }
}

String _$cardScanHash() => r'55ad57374cbce1fdf6a232764c7cb49e7e270fd4';

abstract class _$CardScan extends $Notifier<CardScanEntity> {
  CardScanEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CardScanEntity, CardScanEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CardScanEntity, CardScanEntity>,
              CardScanEntity,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
