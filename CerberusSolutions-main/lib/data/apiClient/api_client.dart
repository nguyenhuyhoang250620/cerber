import 'dart:convert';
import 'package:cerberus_ai_system/data/models/cctv_model.dart';
import 'package:dio/dio.dart';
import 'package:cerberus_ai_system/data/models/vms_camera_model.dart';
import 'package:cerberus_ai_system/data/models/truyvet_model.dart';

import 'package:cerberus_ai_system/data/models/xacthuc_model.dart';
import 'package:flutter/rendering.dart';

import '../models/vms_location_model.dart';
import 'package:web_socket_channel/io.dart';

typedef WebSocketEventCallback = void Function(Map<String, dynamic> json);

class ApiClient {
  static final ApiClient apiClient = ApiClient._internal();

  factory ApiClient() {
    return apiClient;
  }

  ApiClient._internal();

  String baseUrl = 'http://103.172.79.238:8080';
  late String wsUrl = baseUrl.replaceAll("http", "ws");
  late IOWebSocketChannel webSocketChannel =
      IOWebSocketChannel.connect('$wsUrl/ws/vms-server/');
  final Dio dio = Dio();

  void registerWebsocketEvent(WebSocketEventCallback callback) {
    print('thanhndh');
    webSocketChannel.stream.listen((message) {
      Map<String, dynamic> message_json = json.decode(message);
      callback(message_json);
    });
  }

  Future<List<VMSCameraModel>> getVMSCamera() async {
    return await dio.get('$baseUrl/api/vms/camera/get/').then((response) {
      List<VMSCameraModel> vmsCameras = [];
      for (var item in response.data) {
        vmsCameras.add(VMSCameraModel.fromJson(item));
      }
      return vmsCameras;
    });
  }

//103.172.79.238:8080/ws://baseurl/ws/vms-server/
  Future<VMSCameraModel> addVMSCamera(
      String cameraName, String cameraUrl) async {
    var data = {
      "camera_name": cameraName,
      "camera_url": cameraUrl,
    };
    return await dio
        .post('$baseUrl/api/vms/camera/add/', data: jsonEncode(data))
        .then((response) {
      var vmsCamera = VMSCameraModel.fromJson(response.data);
      return vmsCamera;
    });
  }

  Future<TruyVetModel> getTruyVetData(
      {required String frontPath,
      required String backPath,
      String cameraIdList = "",
      String locationIdList = "",
      String startTime = "",
      String endTime = ""}) async {
    Map<String, dynamic> map = {
      "front": await MultipartFile.fromFile(frontPath),
      "back": await MultipartFile.fromFile(backPath)
    };

    if (cameraIdList != "") {
      map.addAll({"camera_id": cameraIdList});
    }
    if (locationIdList != "") {
      map.addAll({"location_id": locationIdList});
    }
    if (startTime != "") {
      map.addAll({"start_time": startTime});
    }
    if (endTime != "") {
      map.addAll({"end_time": endTime});
    }

    FormData formData = FormData.fromMap(map);
    return await dio
        .post('$baseUrl/api/ocr/citizen_tracking/', data: formData)
        .then((response) {
      var truyvetData = TruyVetModel.fromJson(response.data);
      return truyvetData;
    });
  }

  Future<XacThucModel> getXacThucData(String userId, String company,
      String frontPath, String backPath, String portraitPath) async {
    FormData formData = FormData.fromMap({
      "userid": userId,
      "company": company,
      "front": await MultipartFile.fromFile(frontPath),
      "back": await MultipartFile.fromFile(backPath),
      "portrait": await MultipartFile.fromFile(portraitPath),
    });
    return await dio
        .post('$baseUrl/ekyc/process', data: formData)
        .then((response) {
      var xacThucData = XacThucModel.fromJson(response.data);
      return xacThucData;
    });
  }

  Future<List<VMSLocationModel>> getVMSLocationDataList() async {
    return await dio.get('$baseUrl/api/vms/location/get/').then((response) {
      List<VMSLocationModel> vmsLocationList = [];
      for (var item in response.data) {
        vmsLocationList.add(VMSLocationModel.fromJson(item));
      }
      return vmsLocationList;
    });
  }

  Future<VMSLocationModel> getVMSLocationById({required int locationId}) async {
    return await dio.get('$baseUrl/api/vms/location/get/',
        queryParameters: {"id": locationId}).then((response) {
      var vmsLocation = VMSLocationModel.fromJson(response.data);
      return vmsLocation;
    });
  }

  Future<List<VMSCameraModel>> getVMSCameraByLocation(int locationId) async {
    var data = {
      "location_id": locationId,
    };
    return await dio
        .post('$baseUrl/api/vms/camera/get_by_location/',
            data: jsonEncode(data))
        .then((response) {
      List<VMSCameraModel> vmsCameraList = [];
      for (var item in response.data) {
        vmsCameraList.add(VMSCameraModel.fromJson(item));
      }
      return vmsCameraList;
    });
  }

  Future<List<CCTVModel>> getCCTVEventList() async {
    return await dio.get('$baseUrl/api/cctv/get/').then((response) {
      List<CCTVModel> cctvEventList = [];
      for (var item in response.data) {
        cctvEventList.add(CCTVModel.fromJson(item));
      }
      return cctvEventList;
    });
  }
}
