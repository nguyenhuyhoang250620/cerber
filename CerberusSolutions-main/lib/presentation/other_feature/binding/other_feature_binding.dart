import 'package:cerberus_ai_system/presentation/other_feature/controller/other_feature_controller.dart';
import 'package:get/get.dart';

class OtherFeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OtherFeatureController(), permanent: true);
  }
}
