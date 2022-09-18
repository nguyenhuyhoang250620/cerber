import 'package:cerberus_ai_system/presentation/support_screen/controller/support_controller.dart';
import 'package:get/get.dart';

class SupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SupportController(), permanent: true);
  }
}
