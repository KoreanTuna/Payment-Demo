import 'package:flutter/material.dart';
import 'package:payment_demo/core/constant/png_image_path.dart';

class Card3D extends StatefulWidget {
  const Card3D({super.key});

  @override
  State<Card3D> createState() => _Card3DState();
}

class _Card3DState extends State<Card3D> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;
  double _drag = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPointerMove(PointerMoveEvent event) {
    setState(() {
      _drag += event.delta.dx * 0.01;
      _drag = _drag.clamp(-0.5, 0.5);
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    _animation =
        Tween<double>(begin: _drag, end: 0).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          ),
        )..addListener(() {
          setState(() {
            _drag = _animation.value;
          });
        });

    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // _drag: -0.5 ~ +0.5 → center.dx: 0.2 ~ 0.8
    final gradientCenter = Alignment(_drag * 1.6, -_drag * 0.5);

    return Listener(
      onPointerMove: _onPointerMove,
      onPointerUp: _onPointerUp,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(-_drag),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 카드
            Padding(
              padding: const EdgeInsets.only(bottom: 68),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      width: double.infinity,
                      height: 200,
                      PngImagePath.card,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: RadialGradient(
                        center: gradientCenter,
                        radius: 1.4,
                        colors: [
                          Colors.transparent,
                          Colors.white.withValues(alpha: 0.08),
                          Colors.white.withValues(alpha: 0.15),
                        ],

                        stops: const [0.0, 0.6, 1.0],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
