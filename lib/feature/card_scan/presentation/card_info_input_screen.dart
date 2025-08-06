import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/common/provider/state/user_event.dart';
import 'package:payment_demo/common/widget/base/base_screen.dart';
import 'package:payment_demo/common/widget/custom_appbar.dart';
import 'package:payment_demo/common/widget/custom_button.dart';
import 'package:payment_demo/common/widget/info_input_row.dart';
import 'package:payment_demo/core/router/route_path.dart';
import 'package:payment_demo/core/theme/color_style.dart';
import 'package:payment_demo/core/theme/text_style.dart';
import 'package:payment_demo/feature/card_scan/domain/entities/card_scan_entity.dart';
import 'package:payment_demo/feature/card_scan/presentation/state/card_scan_event.dart';
import 'package:payment_demo/feature/card_scan/presentation/state/card_scan_state.dart';

class CardInfoInputScreen extends BaseScreen
    with CardScanState, CardScanEvent, UserEvent {
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

    final ScrollController scrollController = useScrollController();

    useEffect(
      () {
        /// 스크롤이 위로 움직일때 키보드 해제
        scrollController.addListener(() {
          if (scrollController.position.pixels <= 0) {
            FocusScope.of(context).unfocus();
          }
        });

        return null;
      },
      [],
    );

    // const factory CardScanEntity({
    //   required String cardNumber,
    //   required String cardHolderName,
    //   required int expirationYear,
    //   required int expirationMonth,
    //   int? cvc,
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListView(
            controller: scrollController,
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoInputWidget(
                    title: '소지자',
                    isDisabled: cardScan.cardHolderName.isNotEmpty,
                    initialValue: cardScan.cardHolderName,
                    hintText: '카드 소지자의 이름을 입력하세요',
                    onChanged: (String value) => updateCardHolderName(
                      ref: ref,
                      cardHolderName: value,
                    ),
                  ),
                  InfoInputWidget(
                    title: '카드 번호',
                    isDisabled: cardScan.cardNumber.isNotEmpty,
                    initialValue: cardScan.cardNumber,
                    hintText: '카드 번호를 입력하세요',
                    onChanged: (String value) => updateCardNumber(
                      ref: ref,
                      cardNumber: value,
                    ),
                  ),
                  const Divider(
                    height: 48,
                    thickness: 0.5,
                    color: ColorStyle.coolGray300,
                  ),
                  Text(
                    '유효기간',
                    style: const TextStyle().subTitle4,
                  ),
                  const SizedBox(height: 8),

                  Row(
                    spacing: 20,
                    children: [
                      InfoInputWidget(
                        width: 120,
                        title: '년',
                        isDisabled: cardScan.expirationYear != 0,
                        initialValue: cardScan.expirationYear.toString(),
                        hintText: '유효기간 년도를 입력하세요',
                        onChanged: (String value) => updateExpirationYear(
                          ref: ref,
                          expirationYear: int.tryParse(value) ?? 0,
                        ),
                      ),
                      InfoInputWidget(
                        width: 80,
                        title: '월',
                        isDisabled: cardScan.expirationMonth != 0,
                        initialValue: cardScan.expirationMonth.toString(),
                        hintText: '유효기간 월을 입력하세요',
                        onChanged: (String value) => updateExpirationMonth(
                          ref: ref,
                          expirationMonth: int.tryParse(value) ?? 0,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),
                  InfoInputWidget(
                    title: 'CVC',
                    keyboardType: TextInputType.number,
                    initialValue: cardScan.cvc?.toString() ?? '',
                    hintText: '카드 뒷면의 CVC를 입력하세요',
                    onChanged: (String value) {
                      if (value.isEmpty) {
                        updateCvc(ref: ref, cvc: -1);
                        return;
                      }

                      if (int.tryParse(value) == null) return;
                      updateCvc(
                        ref: ref,
                        cvc: int.parse(value),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        CustomButton(
          label: '카드 등록',
          onPressed: () {
            updateUserCards(
              ref: ref,
              cards: [cardScan],
            );
            context.goNamed(RoutePath.home);
          },
          isEnabled: cardScan.isValid,
        ),
      ],
    );
  }
}
