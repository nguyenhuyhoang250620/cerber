import 'package:cerberus_ai_system/data/apiClient/api_client.dart';
import 'package:cerberus_ai_system/data/models/vms_camera_model.dart';
import 'package:cerberus_ai_system/data/models/vms_location_model.dart';
import 'package:dio/dio.dart';
import '/core/app_export.dart';

class LocationController extends GetxController {
  final apiClient = ApiClient();
  var _vmsCameraByLocation;
  var _locationModelList;
  var _locationModel;
  var _errorMessage;
  final _isLoading = true.obs;
  final _isError = false.obs;

  bool get isLoading => _isLoading.value;

  bool get isError => _isError.value;

  List<VMSLocationModel> get locationModelList => _locationModelList;
  VMSLocationModel get locationModel => _locationModel;
  List<VMSCameraModel> get vmsCameraByLocation => _vmsCameraByLocation;

  String get errorMessage => _errorMessage;

  void getVMSLocationDataList() {
    print("getVMSLocationData");
    _locationModelList = null;
    _errorMessage = null;
    _isError.value = _errorMessage != null;
    _isLoading.value = true;

    apiClient.getVMSLocationDataList().then((vmsLocationModelList) {
      _locationModelList = vmsLocationModelList;
      print(vmsLocationModelList.map((e) => e.toJson().toString()));
    }).catchError((err) {
      print(err);
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
      _isLoading.value = _locationModelList == null;
    });
  }

  void getVMSLocationDataById(int locationId) {
    print("getVMSLocationData");
    _locationModel = null;
    _errorMessage = null;
    _isError.value = _errorMessage != null;
    _isLoading.value = true;

    apiClient.getVMSLocationById(locationId: locationId).then((vmsLocationModel) {
      _locationModel = vmsLocationModel;
      print(vmsLocationModel.toJson().toString());
    }).catchError((err) {
      print(err);
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
      _isLoading.value = _locationModel == null;
    });
  }

  void getVMSCameraByLocationData(location_id) {
    print("getVMSCameraByLocationData");
    _vmsCameraByLocation = null;
    _errorMessage = null;
    _isError.value = _errorMessage != null;
    _isLoading.value = true;

    apiClient.getVMSCameraByLocation(location_id).then((vmsCameraByLocationData) {
      _vmsCameraByLocation = vmsCameraByLocationData;
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
      _isLoading.value = _vmsCameraByLocation == null;
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
}
