import '../controller/ekyc_controller.dart';
import 'package:get/get.dart';

class EkycBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EkycController());
  }
}
