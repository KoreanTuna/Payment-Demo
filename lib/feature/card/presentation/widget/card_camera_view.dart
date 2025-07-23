import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:payment_demo/common/widget/custom_button.dart';
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
    _controller = CameraController(
      getRearCamera(), // default: 후면 카메라
      ResolutionPreset.medium,
    );
    _initFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      '정해진 위치에 카드를 가져다 대고 아래 버튼을 눌러주세요',
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
                                SnackBar(content: Text('이미지 캡처 실패: $error')),
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
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
