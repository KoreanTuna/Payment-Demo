import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:payment_demo/core/util/result.dart';
import 'package:payment_demo/feature/card_scan/data/models/card_scan_model.dart';
import 'package:payment_demo/feature/card_scan/domain/entities/card_scan_entity.dart';
import 'package:payment_demo/feature/card_scan/domain/repository/card_scan_repository.dart';

@LazySingleton(as: CardScanRepository)
class CardScanRepositoryImpl implements CardScanRepository {
  @override
  Future<Result<CardScanEntity>> uploadCardImage(FormData formData) async {
    const CardScanModel fakeModel = CardScanModel(
      cardNumber: '1234-5678-9012-3456',
      cardHolderName: 'Song Min Woo',
      expirationYear: 2025,
      expirationMonth: 12,
    );

    /// 실패케이스
    // return Result.error(CustomNetworkException('카드 정보가 올바르지 않습니다.'));

    /// 성공케이스
    /// REST API 통신 시뮬레이션
    return Future.delayed(
      const Duration(seconds: 2),
      () => Result<CardScanEntity>.ok(
        CardScanEntity.fromJson(fakeModel.toJson()),
      ),
    );
  }
}
