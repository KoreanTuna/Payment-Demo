import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/feature/card_scan/presentation/provider/card_scan_provider.dart';

mixin class CardScanEvent {
  void updateCvc({
    required WidgetRef ref,
    required int cvc,
  }) {
    ref.read(cardScanProvider.notifier).updateCardScan(cvc: cvc);
  }

  void updateCardHolderName({
    required WidgetRef ref,
    required String cardHolderName,
  }) {
    ref
        .read(cardScanProvider.notifier)
        .updateCardScan(cardHolderName: cardHolderName);
  }

  void updateCardNumber({
    required WidgetRef ref,
    required String cardNumber,
  }) {
    ref.read(cardScanProvider.notifier).updateCardScan(cardNumber: cardNumber);
  }

  void updateExpirationMonth({
    required WidgetRef ref,
    required int expirationMonth,
  }) {
    ref
        .read(cardScanProvider.notifier)
        .updateCardScan(expirationMonth: expirationMonth);
  }

  void updateExpirationYear({
    required WidgetRef ref,
    required int expirationYear,
  }) {
    ref
        .read(cardScanProvider.notifier)
        .updateCardScan(expirationYear: expirationYear);
  }
}
