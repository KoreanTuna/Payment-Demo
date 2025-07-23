import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:payment_demo/feature/card_scan/domain/entities/card_scan_entity.dart';

part 'user_entity.g.dart';
part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String name,
    required List<CardScanEntity> cards,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  factory UserEntity.empty() {
    return const UserEntity(
      id: '',
      name: '',
      cards: [],
    );
  }
}
