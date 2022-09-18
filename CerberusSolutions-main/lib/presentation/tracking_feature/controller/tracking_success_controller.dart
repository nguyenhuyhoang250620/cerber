import 'package:cerberus_ai_system/presentation/tracking_feature/controller/tracking_controller.dart';
import 'package:cerberus_ai_system/presentation/tracking_feature/models/tracking_success_models.dart';
import 'package:cerberus_ai_system/presentation/tracking_feature/models/frame_model.dart';
import '/core/app_export.dart';

class TrackingSuccessController extends TrackingController {
  Rx<TrackingSuccesModel> trackingSuccessModelObj = TrackingSuccesModel().obs;
  Rx<FrameModel> frame34663ModelObj = FrameModel().obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
