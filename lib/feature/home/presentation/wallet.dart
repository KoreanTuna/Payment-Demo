import 'package:flutter/material.dart';

class NotchedCard extends StatelessWidget {
  const NotchedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: 260,
          child: CustomPaint(
            painter: _NotchedCardPainter(),
          ),
        ),
      ),
    );
  }
}

class _NotchedCardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double r = 36.0; // 좌상/우상/좌하 라운드 반경
    const double hallPortion = 0.48;
    const double ballRFactor = 2;

    final path = Path()
      // ── 좌상단
      ..moveTo(r, 0)
      ..lineTo(size.width - r, 0)
      ..quadraticBezierTo(size.width, 0, size.width, r)
      ..lineTo(size.width, size.height * hallPortion)
      ..quadraticBezierTo(
        size.width,
        size.height * hallPortion + r,
        size.width - r,
        size.height * hallPortion + r,
      )
      ..quadraticBezierTo(
        size.width - r - r * ballRFactor,
        size.height * hallPortion + r,
        size.width - r - r * ballRFactor,
        size.height * hallPortion + r * 2.5,
      )
      ..quadraticBezierTo(
        size.width - r - r * ballRFactor,
        size.height,
        size.width - r - r * ballRFactor - r,
        size.height,
      )
      ..lineTo(0 + r, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - r)
      ..lineTo(0, r)
      ..quadraticBezierTo(0, 0, r, 0);

    // 색 채우기
    final paint = Paint()..color = const Color.fromARGB(255, 22, 66, 200);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
