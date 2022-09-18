import 'package:cerberus_ai_system/presentation/camera_preview/controller/scan_controller.dart';
import 'package:flutter/material.dart';
import 'package:cerberus_ai_system/presentation/camera_preview/camera_stream/camera_screen.dart';
import 'package:cerberus_ai_system/presentation/camera_preview/camera_stream/camera_viewer.dart';

import 'package:get/get.dart';

class CameraStream extends GetWidget<ScanController> {
  const CameraStream({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CameraScreen(),
    );
  }
}
