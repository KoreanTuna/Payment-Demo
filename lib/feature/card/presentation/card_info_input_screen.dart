import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/common/widget/base/base_screen.dart';
import 'package:payment_demo/common/widget/custom_appbar.dart';
import 'package:payment_demo/common/widget/info_input_row.dart';
import 'package:payment_demo/core/util/logger.dart';
import 'package:payment_demo/feature/card/domain/entities/card_scan_entity.dart';
import 'package:payment_demo/feature/card/presentation/state/card_scan_state.dart';

class CardInfoInputScreen extends BaseScreen with CardScanState {
  const CardInfoInputScreen({super.key});
  @override
  PreferredSizeWidget? renderAppBar(BuildContext context, WidgetRef ref) {
    return CustomAppbar(
      title: '카드 정보 입력',
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: context.pop,
      ),
    );
  }

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    final CardScanEntity cardScan = getCardScan(ref);

    logger.e(cardScan);
    // const factory CardScanEntity({
    //   required String cardNumber,
    //   required String cardHolderName,
    //   required int expirationYear,
    //   required int expirationMonth,
    //   int? cvc,
    return Column(
      children: [
        InfoInputWidget(
          title: '소지자',
          isDisabled: cardScan.cardHolderName.isNotEmpty,
          initialValue: cardScan.cardHolderName,
          hintText: '카드 소지자의 이름을 입력하세요',
          onChanged: (String value) {},
        ),
      ],
    );
  }
}
