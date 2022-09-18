import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/core/utils/helper.dart';
import 'package:cerberus_ai_system/presentation/camera_preview/controller/scan_controller.dart';
import 'package:cerberus_ai_system/widgets/custom_admin_scaffold.dart';
import 'package:cerberus_ai_system/widgets/custom_button.dart';
import 'package:cerberus_ai_system/widgets/glassmorphism_button.dart';
import 'package:flutter/material.dart';
import 'package:cerberus_ai_system/widgets/custom_button.dart';

class CameraScreen extends GetWidget<ScanController> {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAdminScaffold(
      route: AppRoutes.cameraPreview,
      pathImageBackground: Constants.backgroundPath,
      body: Container(
        margin: EdgeInsets.all(40),
        child: getGlassmorphicContainer(
          borderRadius: 16,
          border: 1,
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlassmorphismButton(
                  borderRadius: 16,
                  width: 50,
                  height: 50,
                  text: "camera".tr,
                  onTap: () {
                    Get.toNamed(AppRoutes.cameraStream);
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                GlassmorphismButton(
                  borderRadius: 16,
                  width: 50,
                  height: 50,
                  text: "camera1".tr,
                  onTap: () {
                    Get.toNamed(AppRoutes.cameraRTSP);
                  },
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
