import 'package:flutter_vlc_player/flutter_vlc_player.dart';

import '/core/app_export.dart';
import 'package:flutter/material.dart';

class CameraRTSPController extends GetxController {
  late final VlcPlayerController controller;

  Future<void> _play() {
    return controller.play();
  }

  Future<void> _replay() async {
    await controller.stop();
    await controller.play();
  }

  Future<void> _pause() async {
    if (controller.value.isPlaying) {
      await controller.pause();
    }
  }

  /// Returns a callback which seeks the video relative to current playing time.
  Future<void> _seekRelative(Duration seekStep) async {
    if (controller.value.duration != null) {
      await controller.seekTo(controller.value.position + seekStep);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
