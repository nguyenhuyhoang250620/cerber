import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/presentation/support_screen/controller/support_controller.dart';
import 'package:cerberus_ai_system/widgets/custom_admin_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:play_kit/play_kit.dart';

class SettingScreen extends GetWidget<SupportController> {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAdminScaffold(
      route: AppRoutes.settingScreen,
      pathImageBackground: Constants.backgroundPath,
      body: PlayContainer(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        height: Get.height,
        width: Get.width,
        dark: false,
        child: Center(
          child: Text(
            'CÀI ĐẶT',
            style: AppStyle.commonTextStyle.copyWith(fontSize: 32),
          ),
        ),
      )
    );
  }
}
