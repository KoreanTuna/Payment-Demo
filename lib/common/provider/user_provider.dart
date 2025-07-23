import 'package:payment_demo/common/domain/entities/user_entity.dart';
import 'package:payment_demo/feature/card_scan/domain/entities/card_scan_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
class User extends _$User {
  @override
  UserEntity build() {
    return UserEntity.empty();
  }

  void updateUser(UserEntity user) {
    state = user;
  }

  void updateCards(List<CardScanEntity> cards) {
    state = state.copyWith(cards: cards);
  }
}
