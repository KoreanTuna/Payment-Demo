import 'dart:typed_data';

import 'package:payment_demo/core/exception/custom_exception.dart';
import 'package:payment_demo/core/util/result.dart';
import 'package:payment_demo/environment/getit.dart';
import 'package:payment_demo/feature/card/domain/entities/card_scan_entity.dart';
import 'package:payment_demo/feature/card/domain/usecase/card_scan_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'card_scan_provider.g.dart';

@riverpod
class CardScan extends _$CardScan {
  final CardScanUsecase _usecase = locator<CardScanUsecase>();

  @override
  CardScanEntity build() {
    return CardScanEntity.empty();
  }

  void updateCardScan(CardScanEntity cardScan) {
    state = cardScan;
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
        updateCardScan(entity);
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
