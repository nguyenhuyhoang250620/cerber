import 'package:flutter/material.dart';
import 'package:cerberus_ai_system/presentation/camera_preview/camera_stream/camera_viewer.dart';
import 'package:cerberus_ai_system/presentation/camera_preview/camera_stream/capture_button.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CameraViewer(),
        CaptureButton(),
      ],
    );
  }
}
