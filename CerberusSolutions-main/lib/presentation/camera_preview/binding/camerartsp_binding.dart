import '../controller/RTSP_controller.dart';
import 'package:get/get.dart';

class RTSPBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CameraRTSPController(), permanent: true);
  }
}
