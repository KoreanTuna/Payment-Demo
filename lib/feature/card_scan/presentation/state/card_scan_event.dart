import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/feature/card_scan/presentation/provider/card_scan_provider.dart';

mixin class CardScanEvent {
  void updateCvc({
    required WidgetRef ref,
    required int cvc,
  }) {
    ref.read(cardScanProvider.notifier).updateCardScan(cvc: cvc);
  }
}
