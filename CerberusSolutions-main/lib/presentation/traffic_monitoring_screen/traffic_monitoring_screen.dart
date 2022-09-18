import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/presentation/traffic_monitoring_screen/controller/traffic_monitoring_controller.dart';
import 'package:cerberus_ai_system/widgets/custom_admin_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:play_kit/play_kit.dart';

class TrafficMonitoringScreen extends GetWidget<TrafficMonitoringController> {
  const TrafficMonitoringScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAdminScaffold(
      route: AppRoutes.trafficMonitoring,
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
            'GIÁM SÁT GIAO THÔNG',
            style: AppStyle.commonTextStyle.copyWith(fontSize: 32),
            ),
          ),
        ),
      )
    );
  }
}
