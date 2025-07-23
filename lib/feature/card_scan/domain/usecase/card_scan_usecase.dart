import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:payment_demo/core/exception/custom_exception.dart';
import 'package:payment_demo/core/util/form_data_util.dart';
import 'package:payment_demo/core/util/result.dart';
import 'package:payment_demo/feature/card_scan/domain/entities/card_scan_entity.dart';
import 'package:payment_demo/feature/card_scan/domain/repository/card_scan_repository.dart';

@lazySingleton
class CardScanUsecase {
  CardScanUsecase(
    this._repository,
    this._formDataUtil,
  );

  final CardScanRepository _repository;
  final FormDataUtil _formDataUtil;

  Future<Result<CardScanEntity>> uploadCardImage({
    required Uint8List imageData,
    required String fileName,
  }) async {
    late final FormData formData;
    try {
      formData = _formDataUtil.getFormData(
        imageDataList: [imageData],
        fileName: [fileName],
      );

      return await _repository.uploadCardImage(formData);
    } catch (e) {
      return Result<CardScanEntity>.error(
        CustomFormatException('카드 이미지 업로드 실패: $e'),
      );
    }
  }
}
