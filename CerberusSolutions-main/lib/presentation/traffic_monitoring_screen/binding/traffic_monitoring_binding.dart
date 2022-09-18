import 'package:cerberus_ai_system/presentation/traffic_monitoring_screen/controller/traffic_monitoring_controller.dart';
import 'package:get/get.dart';

class TrafficMonitoringBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TrafficMonitoringController(), permanent: true);
  }
}
