import 'package:cerberus_ai_system/presentation/area_controlling_screen/controller/area_controlling_controller.dart';
import 'package:get/get.dart';

class AreaControllingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AreaControllingController(), permanent: true);
  }
}
