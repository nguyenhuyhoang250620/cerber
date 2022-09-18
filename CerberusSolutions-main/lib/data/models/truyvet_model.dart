import 'dart:convert';

import 'package:cerberus_ai_system/data/models/cctv_model.dart';
import 'package:cerberus_ai_system/data/models/ocr_model.dart';

class TruyVetModel {
  final OCRModel ocrData;
  final List<CCTVModel> cctvDataList;
  final bool isMatch;
  final OCRModel data;

  TruyVetModel({
    required this.ocrData,
    required this.cctvDataList,
    required this.isMatch,
    required this.data,
  });

  factory TruyVetModel.fromJson(Map<String, dynamic> json) {
    List<CCTVModel> cctvDataList = [];
    for (var item in json['cctvData']) {
      cctvDataList.add(CCTVModel.fromJson(item));
    }
    return TruyVetModel(
        ocrData: OCRModel.fromJson(json['ocrData'] ?? ""),
        cctvDataList: cctvDataList,
        isMatch: json['isMatch'] ?? false,
        data: OCRModel.fromJson(json['data'] ?? ""));
  }

  Map<String, dynamic> toJson() {
    var cctvDataJsonList = [];
    for (var item in cctvDataList) {
      print(item);
      cctvDataJsonList.add(item.toJson());
    }
    return {
      "ocrData": ocrData.toJson(),
      "cctvData": jsonEncode(cctvDataJsonList),
      "isMatch": isMatch,
      "data": data.toJson()
    };
  }
}
