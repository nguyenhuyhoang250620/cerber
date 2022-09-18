import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:cerberus_ai_system/presentation/ekyc_screen/controller/ekyc_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

typedef void StringCallback(String val);

class CameraApp extends GetWidget<EkycController> {
  CameraApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(() => controller.tests != ""
              ? Column(
                  children: [
                    Image.network(controller.tests),
                    ElevatedButton(
                      onPressed: () async {
                        controller.test = "".obs;
                        Get.back();
                      },
                      child: Text('V'),
                    )
                  ],
                )
              : Column(
                  children: [
                    AspectRatio(
                        aspectRatio: 16 / 9,
                        child: CameraPreview(controller.cameraController!)),
                    ElevatedButton(
                      onPressed: () async {
                        final file =
                            await controller.cameraController!.takePicture();
                        print(file.runtimeType);
                        controller.captureWeb(file);
                        // ekycController.pickTest();
                      },
                      child: Text('Take picture.'),
                    )
                  ],
                )),
        ],
      ),
    );
  }
}
