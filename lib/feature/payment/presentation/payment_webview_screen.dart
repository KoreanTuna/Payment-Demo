import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_demo/common/widget/dialog/common_dialog.dart';
import 'package:payment_demo/core/router/route_path.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentWebViewScreen extends StatefulWidget {
  const PaymentWebViewScreen({super.key});

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  InAppWebViewController? _controller;
  late final PullToRefreshController _pullToRefreshController;

  String get _serverUrl => Platform.isAndroid
      ? 'http://10.0.2.2:3000/payment_demo.html'
      : 'http://localhost:3000/payment_demo.html';

  @override
  void initState() {
    super.initState();
    _pullToRefreshController = PullToRefreshController(
      onRefresh: () async {
        if (Platform.isAndroid) {
          await _controller?.reload();
        } else {
          final url = await _controller?.getUrl();
          if (url != null) {
            await _controller?.loadUrl(urlRequest: URLRequest(url: url));
          }
        }
      },
    );
  }

  Future<bool> _handleWillPop() async {
    if (_controller != null && await _controller!.canGoBack()) {
      await _controller!.goBack();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          _handleWillPop();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: InAppWebView(
            initialSettings: InAppWebViewSettings(
              useShouldOverrideUrlLoading: true, // 반드시 켜야 스킴 인터셉트 가능
              mediaPlaybackRequiresUserGesture: false,
              allowsInlineMediaPlayback: true,
            ),
            // 로컬 서버로 접속
            initialUrlRequest: URLRequest(url: WebUri(_serverUrl)),
            pullToRefreshController: _pullToRefreshController,
            onWebViewCreated: (controller) => _controller = controller,

            onLoadStop: (controller, url) async {
              await _pullToRefreshController.endRefreshing();
            },
            onReceivedError: (controller, request, error) {
              _pullToRefreshController.endRefreshing();
              debugPrint(
                'Load error: ${error.type}  for ${request.url}',
              );
            },

            // 새 창(target=_blank) 열기 요청 처리 (WebView 내부에서 열리도록)
            onCreateWindow: (controller, createWindowRequest) async {
              await controller.loadUrl(
                urlRequest: URLRequest(url: createWindowRequest.request.url),
              );
              return true;
            },

            shouldOverrideUrlLoading: (controller, navigationAction) async {
              final uri = navigationAction.request.url;
              if (uri == null) {
                return NavigationActionPolicy.ALLOW;
              }

              // 1) 커스텀 스킴: paymentdemo://
              if (uri.scheme == 'paymentdemo') {
                switch (uri.host) {
                  case 'success':
                    if (mounted) {
                      context.goNamed(
                        RoutePath.paymentSuccess,
                        queryParameters: uri.queryParameters,
                      );
                    }
                    break;
                  case 'failure':
                    final message =
                        uri.queryParameters['message'] ?? '결제에 실패했습니다.';
                    if (mounted) {
                      await showDialog<void>(
                        context: context,
                        builder: (context) => CommonDialog(
                          title: '결제 실패',
                          message: message,
                          onPrimaryAction: () {
                            context.pop();
                          },
                        ),
                      );
                    }
                    break;
                }
                return NavigationActionPolicy.CANCEL;
              }

              // 2) 외부 앱 스킴 처리 (tel:, mailto:, intent:, kakao:, etc.)
              final nonHttpSchemes = {'tel', 'mailto', 'intent'};
              if (nonHttpSchemes.contains(uri.scheme)) {
                final can = await canLaunchUrl(uri);
                if (can) {
                  await launchUrl(uri);
                }
                return NavigationActionPolicy.CANCEL;
              }

              // 3) http/https만 허용 (필요 시 화이트리스트/블랙리스트 추가)
              if (uri.scheme == 'http' || uri.scheme == 'https') {
                return NavigationActionPolicy.ALLOW;
              }

              // 기타 스킴은 차단
              return NavigationActionPolicy.CANCEL;
            },

            // (옵션) 로컬/자가 서명 인증서 테스트 시 허용 로직 (HTTP면 호출 안 됨)
            onReceivedServerTrustAuthRequest: (controller, challenge) async =>
                ServerTrustAuthResponse(
                  action: ServerTrustAuthResponseAction.PROCEED,
                ),
          ),
        ),
      ),
    );
  }
}
