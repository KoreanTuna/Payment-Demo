import 'package:freezed_annotation/freezed_annotation.dart';
part 'card_scan_entity.g.dart';
part 'card_scan_entity.freezed.dart';

@freezed
abstract class CardScanEntity with _$CardScanEntity {
  const factory CardScanEntity({
    required String cardNumber,
    required String cardHolderName,
    required int expirationYear,
    required int expirationMonth,
    int? cvc,
  }) = _CardScanEntity;

  factory CardScanEntity.fromJson(Map<String, dynamic> json) =>
      _$CardScanEntityFromJson(json);

  factory CardScanEntity.empty() {
    return const CardScanEntity(
      cardNumber: '',
      cardHolderName: '',
      expirationYear: 0,
      expirationMonth: 0,
    );
  }
}

extension CardScanEntityExtension on CardScanEntity {
  bool get isValid =>
      cardNumber.isNotEmpty &&
      cardHolderName.isNotEmpty &&
      expirationYear > 0 &&
      expirationMonth > 0 &&
      cvc != null &&
      cvc! > 0 &&
      cvc! < 1000;
}
