import 'package:cerberus_ai_system/presentation/tracking_feature/controller/tracking_success_controller.dart';
import 'package:get/get.dart';

class TrackingSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TrackingSuccessController());
  }
}
