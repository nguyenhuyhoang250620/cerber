import 'package:cerberus_ai_system/core/constants/constants.dart';
import 'package:cerberus_ai_system/presentation/support_screen/controller/support_controller.dart';
import 'package:cerberus_ai_system/routes/app_routes.dart';
import 'package:cerberus_ai_system/theme/app_style.dart';
import 'package:cerberus_ai_system/widgets/custom_admin_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_kit/play_kit.dart';

class SupportScreen extends GetWidget<SupportController> {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAdminScaffold(
        route: AppRoutes.supportScreen,
        pathImageBackground: Constants.backgroundPath,
        body: PlayContainer(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          height: Get.height,
          width: Get.width,
          dark: false,
          child: Center(
            child: Text(
              'HỖ TRỢ',
              style: AppStyle.commonTextStyle.copyWith(fontSize: 32),
            ),
          ),
        )
    );
  }
}
