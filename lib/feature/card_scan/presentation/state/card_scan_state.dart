import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/feature/card_scan/domain/entities/card_scan_entity.dart';
import 'package:payment_demo/feature/card_scan/presentation/provider/card_scan_provider.dart';

mixin class CardScanState {
  CardScanEntity getCardScan(WidgetRef ref) => ref.watch(cardScanProvider);
}
