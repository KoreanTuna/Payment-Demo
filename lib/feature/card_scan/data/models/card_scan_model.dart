import 'package:freezed_annotation/freezed_annotation.dart';
part 'card_scan_model.g.dart';
part 'card_scan_model.freezed.dart';

@freezed
abstract class CardScanModel with _$CardScanModel {
  const factory CardScanModel({
    required String cardNumber,
    required String cardHolderName,
    required int expirationYear,
    required int expirationMonth,
    int? cvc,
  }) = _CardScanModel;

  factory CardScanModel.fromJson(Map<String, dynamic> json) =>
      _$CardScanModelFromJson(json);
}
