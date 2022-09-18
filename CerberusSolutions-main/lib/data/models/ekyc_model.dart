import 'package:cerberus_ai_system/data/models/ocr_model.dart';

class EKYCModel {
  final bool isFaceMatch;
  final bool isMatchIDCard;
  final bool isCurrentFaceVsIDCard;
  final OCRModel data;

  EKYCModel(
      {required this.isFaceMatch,
      required this.isMatchIDCard,
      required this.isCurrentFaceVsIDCard,
      required this.data});

  factory EKYCModel.fromJson(Map<String, dynamic> json) {
    return EKYCModel(
        isFaceMatch: json['is_face_match'] ?? false,
        isMatchIDCard: json['is_match_idcard'] ?? false,
        isCurrentFaceVsIDCard: json['is_current_face_vs_idcard'] ?? false,
        data: OCRModel.fromJson(json['data'] ?? ""));
  }

  Map<String, dynamic> toJson() => {
        "is_face_match": isFaceMatch,
        "is_match_idcard": isMatchIDCard,
        "is_current_face_vs_idcard": isCurrentFaceVsIDCard,
        "data": data.toJson()
      };
}
