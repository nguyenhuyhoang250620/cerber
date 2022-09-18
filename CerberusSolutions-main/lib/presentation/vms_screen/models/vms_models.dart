import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/data/models/selectionPopupModel/selection_popup_model.dart';

class Vms_Models {
  RxList<SelectionPopupModel> dropdownCameraList = [
    SelectionPopupModel(
      id: 1,
      title: "Camera1",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Camera2",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Camera3",
    )
  ].obs;
}
