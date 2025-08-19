import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_demo/core/router/route_path.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('결제 완료')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline,
                color: Colors.green, size: 80),
            const SizedBox(height: 16),
            const Text('결제가 성공적으로 완료되었습니다.'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.goNamed(RoutePath.home),
              child: const Text('홈으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
