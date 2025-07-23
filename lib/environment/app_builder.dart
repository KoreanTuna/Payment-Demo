import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:payment_demo/environment/getit.dart';

late final List<CameraDescription> cameras;

abstract class AppBuilder {
  AppBuilder._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();

    await setUpGetItConfig();
  }
}
