import 'package:cerberus_ai_system/presentation/vms_screen/controller/vms_controller.dart';
import 'package:get/get.dart';

class VmsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VmsController());
  }
}
