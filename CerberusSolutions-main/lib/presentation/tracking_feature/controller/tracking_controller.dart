import 'package:cerberus_ai_system/data/apiClient/api_client.dart';
import 'package:cerberus_ai_system/data/models/cctv_model.dart';
import 'package:cerberus_ai_system/data/models/ocr_model.dart';
import 'package:cerberus_ai_system/data/models/truyvet_model.dart';
import 'package:cerberus_ai_system/presentation/tracking_feature/models/frame_model.dart';
import 'package:cerberus_ai_system/presentation/tracking_feature/models/tracking_models.dart';
import 'package:cerberus_ai_system/presentation/tracking_feature/models/tracking_success_models.dart';
import 'package:cerberus_ai_system/presentation/tracking_feature/models/videoplay_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';

class TrackingController extends GetxController {
  TextEditingController inputTextController = TextEditingController();
  Rx<TrackingModel> truyVetModelObj = TrackingModel().obs;
  Rx<VideoplayModel> videoplayModelObj = VideoplayModel().obs;

  Rx<TrackingSuccesModel> trackingSuccessModelObj = TrackingSuccesModel().obs;
  Rx<FrameModel> frame34663ModelObj = FrameModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;
  final apiClient = ApiClient();
  var _trackingModel;
  var _errorMessage;
  final _isLoading = true.obs;
  final _isError = false.obs;

  bool get isLoading => _isLoading.value;

  bool get isError => _isError.value;

  TruyVetModel get trackingModel => _trackingModel;

  String get errorMessage => _errorMessage;

  void getTrackingData(
      {required String frontPath,
      required String backPath,
      String cameraIdList = "",
      String locationIdList = "",
      String startTime = "",
      String endTime = ""}) {
    print("getTrackingData");
    _trackingModel = null;
    _errorMessage = null;
    _isError.value = _errorMessage != null;
    _isLoading.value = true;

    apiClient
        .getTruyVetData(
            frontPath: frontPath,
            backPath: backPath,
            cameraIdList: cameraIdList,
            locationIdList: locationIdList,
            startTime: startTime,
            endTime: endTime)
        .then((truyVetModel) {
      _trackingModel = truyVetModel;
      print(truyVetModel.toJson().toString());
    }).catchError((err) {
      if (err is DioError) {
        switch (err.type) {
          case DioErrorType.response:
            _errorMessage = err.response?.statusMessage;
            break;
          default:
            _errorMessage = err.toString();
            break;
        }
      } else {
        _errorMessage = err.toString();
      }
    }).whenComplete(() {
      _isError.value = _errorMessage != null;
      _isLoading.value = _trackingModel == null;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    truyVetModelObj.value.dropdownItemList.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    truyVetModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    selectedDropDownValue1 = value as SelectionPopupModel;
    truyVetModelObj.value.dropdownItemList1.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    truyVetModelObj.value.dropdownItemList1.refresh();
  }

  onSelected2(dynamic value) {
    selectedDropDownValue2 = value as SelectionPopupModel;
    truyVetModelObj.value.dropdownItemList2.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    truyVetModelObj.value.dropdownItemList2.refresh();
  }
}
