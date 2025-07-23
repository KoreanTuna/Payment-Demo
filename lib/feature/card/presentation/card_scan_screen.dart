import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:payment_demo/common/widget/base/base_screen.dart';
import 'package:payment_demo/common/widget/custom_appbar.dart';
import 'package:payment_demo/common/widget/dialog/error_dialog.dart';
import 'package:payment_demo/core/router/route_path.dart';
import 'package:payment_demo/core/util/logger.dart';
import 'package:payment_demo/core/util/result.dart';
import 'package:payment_demo/feature/card/domain/entities/card_scan_entity.dart';
import 'package:payment_demo/feature/card/presentation/provider/card_scan_provider.dart';
import 'package:payment_demo/feature/card/presentation/state/card_scan_state.dart';
import 'package:payment_demo/feature/card/presentation/widget/card_camera_view.dart';

class CardScanScreen extends BaseScreen with CardScanState {
  @override
  bool get applyBodyPadding => false;

  const CardScanScreen({super.key});
  @override
  PreferredSizeWidget? renderAppBar(BuildContext context, WidgetRef ref) {
    return CustomAppbar(
      title: '카드 스캔',
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: context.pop,
      ),
    );
  }

  @override
  Widget buildScreen(BuildContext context, WidgetRef ref) {
    final CardScanEntity cardScan = getCardScan(ref);
    final CardScan cardScanNotifier = ref.read(cardScanProvider.notifier);

    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: CardCameraViewScreen(
                onCapture: (XFile file) async {
                  setLoading(ref);
                  logger.d('Captured file: ${file.path}');

                  final Uint8List imageBytes = await file.readAsBytes();

                  /// 이미지 캡처 후 서버에 FormData로 전송
                  final Result<void> submitResult = await cardScanNotifier
                      .submitCardScan(image: imageBytes);

                  clearLoading(ref);
                  submitResult.when(
                    /// 성공적으로 카드 정보가 등록된 경우
                    ok: (_) {
                      context.pushNamed(RoutePath.cardInfoInput);
                    },

                    /// 실패한 경우
                    error: (error) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return ErrorDialog(
                            title: '카드 스캔 실패',
                            message: error.message,
                            onPrimaryAction: context.pop,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
