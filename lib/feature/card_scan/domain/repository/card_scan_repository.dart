import 'package:dio/dio.dart';
import 'package:payment_demo/core/util/result.dart';
import 'package:payment_demo/feature/card_scan/domain/entities/card_scan_entity.dart';

abstract interface class CardScanRepository {
  /// 카드 이미지 캡처 후 서버에 전송
  Future<Result<CardScanEntity>> uploadCardImage(FormData formData);
}
