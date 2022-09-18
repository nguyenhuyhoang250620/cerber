import 'package:cerberus_ai_system/data/models/ocr_model.dart';

class CCTVModel {
  final int id;
  final String soCmt;
  final String image;
  final String thoiGianXuatHien;
  final int cameraId;

  CCTVModel(
      {required this.id,
      required this.soCmt,
      required this.image,
      required this.thoiGianXuatHien,
      required this.cameraId});

  factory CCTVModel.fromJson(Map<String, dynamic> json) {
    return CCTVModel(
        id: json['id'] ?? -1,
        soCmt: json['soCmt'] ?? "",
        image: json['image'] ?? "",
        thoiGianXuatHien: json['thoiGianXuatHien'] ?? "",
        cameraId: json['camera_model'] ?? -1);
  }

  Map<String, dynamic> toJson() =>
      {"id": id, "soCmt": soCmt, "image": image, "thoiGianXuatHien": thoiGianXuatHien, "camera_model": cameraId};
}
