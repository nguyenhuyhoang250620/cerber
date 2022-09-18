import 'package:cerberus_ai_system/data/models/websocket_cctv_event_model.dart';
import 'package:cerberus_ai_system/data/models/websocket_event_type.dart';
import 'package:dio/dio.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/cctv_model.dart';
import '/core/app_export.dart';

class CCTVEventController extends GetxController {
  final apiClient = ApiClient();
  var _cctvEventList;
  var _errorMessage;
  final _eventCount = 0.obs;
  final _isLoading = true.obs;
  final _isError = false.obs;

  bool get isLoading => _isLoading.value;

  bool get isError => _isError.value;

  List<CCTVModel> get cctvEventList => _cctvEventList;

  CCTVEventController() {
    print("NguyenNH :CCTVEventController");
    apiClient.registerWebsocketEvent((json) {
      websocketEvent(json);
    });
  }

  void websocketEvent(Map<String, dynamic> json) {
    WebsocketCCTVEventModel message = WebsocketCCTVEventModel.fromJson(json);
    print("websocketEvent ${message.event}");
    switch (message.event) {
      case WebsocketEventType.CONNECTIO_ESTABLISHED:
        break;
      case WebsocketEventType.CONNECTION_LOST:
        break;
      case WebsocketEventType.CONNECTION_REFUSED:
        break;
      case WebsocketEventType.CONNECTION_ERROR:
        break;
      case WebsocketEventType.VMS_CAMERA_ADD:
        break;
      case WebsocketEventType.VMS_CAMERA_DELETE:
        break;
      case WebsocketEventType.VMS_CAMERA_UPDATE:
        break;
      case WebsocketEventType.VMS_LOCATION_ADD:
        break;
      case WebsocketEventType.VMS_LOCATION_DELETE:
        break;
      case WebsocketEventType.CCTV_ADD:
        print(message.data);
        _cctvEventList.add(message.data);
        _eventCount.value++;
        break;
    }
  }

  void getCCTVEventList() {
    print("getCCTVEventList");
    _cctvEventList = null;
    _errorMessage = null;
    _isError.value = _errorMessage != null;
    _isLoading.value = true;

    apiClient.getCCTVEventList().then((cctvEventList) {
      _cctvEventList = cctvEventList;
      print(cctvEventList.map((e) => e.toJson().toString()));
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
      _isLoading.value = _cctvEventList == null;
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
