import 'package:cerberus_ai_system/presentation/tracking_feature/controller/tracking_controller.dart';
import 'package:get/get.dart';

class TrackingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackingController());
  }
}
