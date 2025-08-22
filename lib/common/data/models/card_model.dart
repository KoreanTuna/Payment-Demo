import 'package:freezed_annotation/freezed_annotation.dart';
part 'card_model.g.dart';
part 'card_model.freezed.dart';

@freezed
abstract class CardModel with _$CardModel {
  const factory CardModel({
    required String id,
    required String name,
    required String number,
    required String expiryDate,
    required String cvv,
  }) = _CardModel;

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);
}
