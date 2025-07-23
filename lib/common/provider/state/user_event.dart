import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/common/provider/user_provider.dart';
import 'package:payment_demo/feature/card_scan/domain/entities/card_scan_entity.dart';

mixin class UserEvent {
  void updateUserCards({
    required WidgetRef ref,
    required List<CardScanEntity> cards,
  }) {
    ref.read(userProvider.notifier).updateCards(cards);
  }
}
