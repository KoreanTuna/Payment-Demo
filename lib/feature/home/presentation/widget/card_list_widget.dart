import 'package:flutter/material.dart';
import 'package:payment_demo/core/extension/context_extension.dart';
import 'package:payment_demo/core/theme/color_style.dart';
import 'package:payment_demo/core/theme/text_style.dart';

class CardStackPage extends StatefulWidget {
  const CardStackPage({super.key});

  @override
  State<CardStackPage> createState() => _CardStackPageState();
}

class _CardStackPageState extends State<CardStackPage>
    with TickerProviderStateMixin {
  bool isExpanded = false;

  final List<CardData> cards = [
    CardData('Shinhan The More', '5699', Colors.black),
    CardData('Woori Card', '7892', Colors.amber),
    CardData('KB Olympic', '2095', Colors.grey),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: isExpanded ? 300 : 70,
            width: context.screenSize.width,
            child: Stack(
              clipBehavior: Clip.none,
              children: List.generate(cards.length, (index) {
                final offset = isExpanded ? index * 100.0 : index * 16.0;
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  top: offset,
                  left: 0,
                  right: 0,
                  child: PaymentCardWidget(card: cards[index]),
                );
              }).reversed.toList(),
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isExpanded ? 24 : 100,
        ),
      ],
    );
  }
}

class CardData {
  final String name;
  final String last4Digits;
  final Color color;

  CardData(this.name, this.last4Digits, this.color);
}

class PaymentCardWidget extends StatelessWidget {
  final CardData card;

  const PaymentCardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: card.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        height: 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                card.name,
                style: const TextStyle().subTitle4.copyWith(
                  color: ColorStyle.white,
                ),
              ),
              Text(
                card.last4Digits,
                style: const TextStyle().subTitle6.copyWith(
                  color: ColorStyle.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
