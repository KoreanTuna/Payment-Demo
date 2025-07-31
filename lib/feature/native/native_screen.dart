import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_demo/core/util/logger.dart';

class BatteryScreen extends StatefulWidget {
  const BatteryScreen({super.key});

  @override
  State<BatteryScreen> createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<BatteryScreen> {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  String _batteryLevel = 'Unknown';
  String _paymentResult = 'Unknown';

  Future<void> _getBatteryLevel() async {
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      setState(() {
        _batteryLevel = 'Battery level: $result%';
      });
    } on PlatformException catch (e) {
      setState(() {
        _batteryLevel = "Failed to get battery level: '${e.message}'.";
      });
    }
  }

  Future<void> sendPaymentRequest() async {
    try {
      final result = await platform.invokeMethod('startPayment', {
        'amount': 10000,
        'currency': 'KRW',
        'orderId': 'ORD12345678',
        'userName': 'Minwoo',
      });

      logger.i('결제 결과: $result');
      setState(() {
        _paymentResult = result.toString();
      });
    } on PlatformException catch (e) {
      logger.e("Failed to start payment: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Battery Level')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_batteryLevel),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _getBatteryLevel,
            child: const Text('Get Battery Level'),
          ),

          const SizedBox(height: 16),

          Text('Payment Result: $_paymentResult'),
          ElevatedButton(
            onPressed: sendPaymentRequest,
            child: const Text('Start Payment'),
          ),
          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: () async {
              try {
                final String result = await platform.invokeMethod(
                  'getDateTime',
                );
                await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Current Date and Time'),
                    content: Column(
                      children: [
                        Text(result),
                        Text('${DateTime.tryParse(result)?.toLocal()}'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              } on PlatformException catch (e) {
                await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Error'),
                    content: Column(
                      children: [
                        Text(
                          "Failed to get date and time: '${e.message}'.",
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
            child: const Text('Get Date and Time'),
          ),
        ],
      ),
    ),
  );
}
