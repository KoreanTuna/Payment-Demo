import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:payment_demo/common/widget/custom_button.dart';
import 'package:payment_demo/core/router/route_path.dart';
import 'package:payment_demo/core/theme/color_style.dart';
import 'package:payment_demo/core/theme/text_style.dart';
import 'package:payment_demo/environment/app_builder.dart';

class CardCameraViewScreen extends StatefulWidget {
  const CardCameraViewScreen({
    super.key,
    required this.onCapture,
    this.aspectRatio = 16 / 9,
  });

  /// 이미지 캡처 콜백
  final Function(XFile file) onCapture;
  final double aspectRatio;

  @override
  State<CardCameraViewScreen> createState() => _CardCameraViewScreenState();
}

class _CardCameraViewScreenState extends State<CardCameraViewScreen> {
  late CameraController _controller;
  late Future<void> _initFuture;

  bool isCameraAvailable = false;

  CameraDescription getRearCamera() {
    // 후면 카메라 우선 선택
    return cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.back,
      orElse: () => cameras.first,
    );
  }

  @override
  void initState() {
    super.initState();
    if (cameras.isEmpty) {
      // 카메라가 없을 경우 처리
      isCameraAvailable = false;
      return;
    }
    isCameraAvailable = true;
    _controller = CameraController(
      getRearCamera(), // default: 후면 카메라
      ResolutionPreset.medium,
    );
    _initFuture = _controller.initialize();
  }

  @override
  void dispose() {
    if (isCameraAvailable) {
      _controller.stopImageStream();
      _controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!isCameraAvailable)
          Expanded(
            child: Center(
              child: Text(
                '카메라를 사용할 수 없습니다.',
                style: const TextStyle().subTitle4.copyWith(
                  color: ColorStyle.coolGray500,
                ),
              ),
            ),
          )
        else
          FutureBuilder(
            future: _initFuture,
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CameraPreview(
                      _controller,
                      child: AspectRatio(
                        aspectRatio: widget.aspectRatio,
                      ),
                    ),
                  ],
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: !isCameraAvailable
              ? _CardScanDisableGuideWidget(
                  onPassed: () {
                    // 직접 입력하기 버튼 클릭 시 동작
                    context.pushNamed(RoutePath.cardInfoInput);
                  },
                )
              : Column(
                  children: [
                    Text(
                      '정해진 위치에 카드를 가져다 대고\n아래 버튼을 눌러주세요',
                      textAlign: TextAlign.center,
                      style: const TextStyle().subTitle5,
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      label: '이미지 캡처',
                      onPressed: () {
                        _controller
                            .takePicture()
                            .then((XFile file) {
                              widget.onCapture(file);
                            })
                            .catchError((error) {
                              // 에러 처리
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('이미지 캡처 실패: $error'),
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            });
                      },
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}

class _CardScanDisableGuideWidget extends StatelessWidget {
  const _CardScanDisableGuideWidget({
    required this.onPassed,
  });

  final VoidCallback onPassed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          label: '직접 입력하기',
          onPressed: onPassed,
        ),
      ],
    );
  }
}
