import 'dart:typed_data';

import 'package:payment_demo/core/exception/custom_exception.dart';
import 'package:payment_demo/core/util/result.dart';
import 'package:payment_demo/environment/getit.dart';
import 'package:payment_demo/feature/card_scan/domain/entities/card_scan_entity.dart';
import 'package:payment_demo/feature/card_scan/domain/usecase/card_scan_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'card_scan_provider.g.dart';

@riverpod
class CardScan extends _$CardScan {
  final CardScanUsecase _usecase = locator<CardScanUsecase>();

  @override
  CardScanEntity build() {
    return CardScanEntity.empty();
  }

  void updateCardScan({
    String? cardNumber,
    String? cardHolderName,
    int? expirationYear,
    int? expirationMonth,
    int? cvc,
  }) {
    state = state.copyWith(
      cardNumber: cardNumber ?? state.cardNumber,
      cardHolderName: cardHolderName ?? state.cardHolderName,
      expirationYear: expirationYear ?? state.expirationYear,
      expirationMonth: expirationMonth ?? state.expirationMonth,
      cvc: cvc ?? state.cvc,
    );
  }

  void resetCardScan() {
    state = CardScanEntity.empty();
  }

  Future<Result<void>> submitCardScan({required Uint8List image}) async {
    final Result<CardScanEntity> result = await _usecase.uploadCardImage(
      imageData: image,
      fileName: 'card_scan.png',
    );

    return result.map(
      ok: (CardScanEntity entity) {
        updateCardScan(
          cardNumber: entity.cardNumber,
          cardHolderName: entity.cardHolderName,
          expirationYear: entity.expirationYear,
          expirationMonth: entity.expirationMonth,
          cvc: entity.cvc,
        );
        return const Result<void>.ok(null);
      },
      error: (error) {
        return Result<void>.error(
          CustomNetworkException('카드 스캔 이미지 업로드 실패'),
        );
      },
    );
  }
}
