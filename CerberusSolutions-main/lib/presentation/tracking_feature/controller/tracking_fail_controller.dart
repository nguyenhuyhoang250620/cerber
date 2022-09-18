import 'package:cerberus_ai_system/presentation/tracking_feature/controller/tracking_controller.dart';
import 'package:cerberus_ai_system/presentation/tracking_feature/models/tracking_fail_model.dart';
import '/core/app_export.dart';

class TrackingFailController extends TrackingController {
  Rx<TrackingFailModel> trackingFailModelObj = TrackingFailModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
