import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/presentation/vms_screen/models/camerapreview_model.dart';
import 'package:cerberus_ai_system/presentation/vms_screen/models/events_model.dart';
import 'package:cerberus_ai_system/presentation/vms_screen/models/selectarea_model.dart';
import 'package:cerberus_ai_system/presentation/vms_screen/models/vms_models.dart';

class VmsController extends GetxController {
  Rx<EventsModel> eventsModelObj = EventsModel().obs;
  Rx<CamerapreviewModel> camerapreviewModelObj = CamerapreviewModel().obs;
  Rx<Vms_Models> vmsModles = Vms_Models().obs;
  Rx<SelectAreaModel> selectAreaModelObj = SelectAreaModel().obs;
  SelectionPopupModel? selectedDropDownValue;
  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    selectAreaModelObj.value.dropdownItemList.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    selectAreaModelObj.value.dropdownItemList.refresh();
  }
}
