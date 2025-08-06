import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:payment_demo/core/extension/context_extension.dart';
import 'package:payment_demo/core/router/base/hero_dialog_route.dart';
import 'package:payment_demo/core/theme/color_style.dart';
import 'package:payment_demo/core/theme/text_style.dart';

class CardStackPage extends StatefulWidget {
  const CardStackPage({super.key});

  @override
  State<CardStackPage> createState() => _CardStackPageState();
}

class _CardStackPageState extends State<CardStackPage>
    with SingleTickerProviderStateMixin {
  List<CardData> cards = [
    CardData('Shinhan The More', '5699', Colors.black),
    CardData('Woori Card', '7892', Colors.amber),
    CardData('KB Olympic', '2095', Colors.grey),
  ];

  int? _selectedIndex;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showOverlay() {
    Navigator.of(context).push(
      HeroDialogRoute(
        builder: (context) {
          return _CardOverlay(
            cards: cards,
            onSelect: (index) async {
              setState(() {
                _selectedIndex = index;
              });
              await _controller.forward();
              setState(() {
                _selectedIndex = null;
                _controller.reset();
              });
            },
            selectedIndex: _selectedIndex,
            fadeAnimation: _fadeAnimation,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        GestureDetector(
          onTap: _showOverlay,
          child: SizedBox(
            height: 70,
            width: context.screenSize.width,
            child: Stack(
              clipBehavior: Clip.none,
              children: List.generate(cards.length, (index) {
                final offset = index * 16.0;
                return Positioned(
                  top: offset,
                  left: 0,
                  right: 0,
                  child: Hero(
                    tag: 'card-${cards[index].last4Digits}',
                    child: Material(
                      type: MaterialType.transparency,
                      child: PaymentCardWidget(
                        key: ValueKey(cards[index].last4Digits),
                        card: cards[index],
                      ),
                    ),
                  ),
                );
              }).reversed.toList(),
            ),
          ),
        ),
        const SizedBox(height: 100),
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
  final VoidCallback? onTap;

  const PaymentCardWidget({super.key, required this.card, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
              gradient: LinearGradient(
                colors: [
                  card.color.withOpacity(0.6),
                  card.color.withOpacity(0.3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
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
      ),
    );
  }
}

class _CardOverlay extends StatelessWidget {
  const _CardOverlay({
    required this.cards,
    required this.onSelect,
    required this.selectedIndex,
    required this.fadeAnimation,
  });

  final List<CardData> cards;
  final void Function(int) onSelect;
  final int? selectedIndex;
  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: SizedBox(
          height: 300,
          width: context.screenSize.width,
          child: Stack(
            clipBehavior: Clip.none,
            children: List.generate(cards.length, (index) {
              final offset = index * 100.0;
              final isSelected = selectedIndex == index;
              return Positioned(
                top: offset,
                left: 0,
                right: 0,
                child: AnimatedBuilder(
                  animation: fadeAnimation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: isSelected
                          ? fadeAnimation.value
                          : (selectedIndex == null ? 1.0 : 0.5),
                      child: Transform.scale(
                        scale: isSelected
                            ? 1.05 + 0.05 * fadeAnimation.value
                            : 1.0,
                        child: child,
                      ),
                    );
                  },
                  child: Hero(
                    tag: 'card-${cards[index].last4Digits}',
                    child: Material(
                      type: MaterialType.transparency,
                      child: PaymentCardWidget(
                        card: cards[index],
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ),
              );
            }).reversed.toList(),
          ),
        ),
      ),
    );
  }
}
