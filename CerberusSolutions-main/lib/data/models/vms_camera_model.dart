class VMSCameraModel {
  final int id;
  final String cameraName;
  final String cameraUrl;
  final int cameraLocation;
  final String cameraCreatedAt;
  final String cameraUpdatedAt;

  VMSCameraModel({
    required this.id,
    required this.cameraName,
    required this.cameraUrl,
    required this.cameraLocation,
    required this.cameraCreatedAt,
    required this.cameraUpdatedAt,
  });

  factory VMSCameraModel.fromJson(Map<String, dynamic> json) {
    return VMSCameraModel(
        id: json['id'] ?? "",
        cameraName: json['camera_name'] ?? "",
        cameraUrl: json['camera_url'] ?? "",
        cameraLocation: json['camera_location'] ?? "",
        cameraCreatedAt: json['camera_created_at'] ?? "",
        cameraUpdatedAt: json['camera_updated_at'] ?? "");
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'camera_name': cameraName,
        'camera_url': cameraUrl,
        'camera_location': cameraLocation,
        'camera_created_at': cameraCreatedAt,
        'camera_updated_at': cameraUpdatedAt,
      };
}
