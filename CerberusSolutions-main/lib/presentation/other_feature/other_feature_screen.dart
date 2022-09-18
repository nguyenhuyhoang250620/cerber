import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/presentation/other_feature/controller/other_feature_controller.dart';
import 'package:cerberus_ai_system/widgets/custom_admin_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:play_kit/play_kit.dart';

class OtherFeatureScreen extends GetWidget<OtherFeatureController> {
  const OtherFeatureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAdminScaffold(
      route: AppRoutes.otherFeatureScreen,
      pathImageBackground: Constants.backgroundPath,
      body: Container(
        margin: const EdgeInsets.all(40),
        child: PlayContainer(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          height: Get.height,
          width: Get.width,
          dark: false,
          child: Center(
            child: Text(
              'CÁC NGHIỆP VỤ KHÁC',
              style: AppStyle.commonTextStyle.copyWith(fontSize: 32),
            ),
          ),
        ),
      )
    );
  }
}

