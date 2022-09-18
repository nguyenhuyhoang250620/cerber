import 'package:cerberus_ai_system/data/models/ocr_model.dart';
import 'package:get/get.dart';

class XacThucModel {
  final String tFaceLiveness = "face_liveness".tr;
  final String tIdNumber = "id_number".tr;
  final String tLocation = "location".tr;
  final String tDate = "date".tr;
  final String tFaceCompare = "face_compare".tr;
  final String tName = "name".tr;
  final String tDob = "dob".tr;
  final String tHometown = "hometown".tr;
  final String tAddress = "address".tr;
  final String tFaceMask = "face_mask".tr;

  final bool faceLiveness;
  final String idNumber;
  final String location;
  final String date;
  final bool faceCompare;
  final String name;
  final String dob;
  final String hometown;
  final String address;
  final String faceMask;
  final OCRModel ocrData;
  final OCRModel ekycData;

  XacThucModel({
    required this.faceLiveness,
    required this.idNumber,
    required this.location,
    required this.date,
    required this.faceCompare,
    required this.name,
    required this.dob,
    required this.hometown,
    required this.address,
    required this.faceMask,
    required this.ocrData,
    required this.ekycData,
  });

  factory XacThucModel.fromJson(Map<String, dynamic> json) {
    return XacThucModel(
        faceLiveness: json['face_liveness'] ?? false,
        idNumber: json['id_number'] ?? "",
        location: json['location'] ?? "",
        date: json['date'] ?? "",
        faceCompare: json['face_compare'] ?? false,
        name: json['name'] ?? "",
        dob: json['dob'] ?? "",
        hometown: json['hometown'] ?? "",
        address: json['address'] ?? "",
        faceMask: json['face_mask'] ?? "",
        ocrData: OCRModel.fromJson(json['ocrData'] ?? ""),
        ekycData: OCRModel.fromJson(json['ekyc_data'] ?? ""));
  }

  Map<String, dynamic> toJson() => {
        "face_liveness": faceLiveness,
        "id_number": idNumber,
        "location": location,
        "date": date,
        "face_compare": faceCompare,
        "name": name,
        "dob": dob,
        "hometown": hometown,
        "address": address,
        "face_mask": "",
        "ocrData": ocrData.toJson(),
        "ekyc_data": ekycData.toJson()
      };
}
