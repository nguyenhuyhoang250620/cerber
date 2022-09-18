import 'package:get/get.dart';
import 'camerapreview_item_model.dart';

class CamerapreviewModel {
  RxList<CamerapreviewItemModel> camerapreviewItemList =
      RxList.filled(30, CamerapreviewItemModel());
}
