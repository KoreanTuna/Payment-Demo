import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_demo/core/router/route_path.dart';

class PaymentWebViewScreen extends StatefulWidget {
  const PaymentWebViewScreen({super.key});

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  InAppWebViewController? _controller;
  String? _htmlData;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/html/payment_demo.html').then((value) {
      setState(() {
        _htmlData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('결제 페이지')),
      body: _htmlData == null
          ? const Center(child: CircularProgressIndicator())
          : InAppWebView(
              initialSettings: InAppWebViewSettings(
                javaScriptEnabled: true,
                incognito: true,
                useShouldOverrideUrlLoading: true,
              ),
              initialData: InAppWebViewInitialData(data: _htmlData!),
              onWebViewCreated: (controller) => _controller = controller,
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                final uri = navigationAction.request.url;
                if (uri == null) {
                  return NavigationActionPolicy.ALLOW;
                }
                if (uri.scheme == 'paymentdemo') {
                  switch (uri.host) {
                    case 'success':
                      if (mounted) {
                        context.goNamed(RoutePath.paymentSuccess);
                      }
                      break;
                    case 'failure':
                      final message =
                          uri.queryParameters['message'] ?? '결제에 실패했습니다.';
                      if (mounted) {
                        showDialog<void>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('결제 실패'),
                            content: Text(message),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('확인'),
                              ),
                            ],
                          ),
                        );
                      }
                      break;
                  }
                  return NavigationActionPolicy.CANCEL;
                }
                return NavigationActionPolicy.ALLOW;
              },
            ),
    );
  }
}
