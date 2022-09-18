class VMSLocationModel {
  final int id;
  final String locationName;
  final String locationCoordinate;
  final String locationCreatedAt;
  final String locationUpdatedAt;

  VMSLocationModel({
    required this.id,
    required this.locationName,
    required this.locationCoordinate,
    required this.locationCreatedAt,
    required this.locationUpdatedAt,
  });

  factory VMSLocationModel.fromJson(Map<String, dynamic> json) {
    //print(json);
    return VMSLocationModel(
        id: json['id'] ?? "",
        locationName: json['location_name'] ?? "",
        locationCoordinate: json['location_coordinate'] ?? "",
        locationCreatedAt: json['location_created_at'] ?? "",
        locationUpdatedAt: json['location_updated_at'] ?? "");
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'location_name': locationName,
        'location_coordinate': locationCoordinate,
        'location_created_at': locationCreatedAt,
        'location_updated_at': locationUpdatedAt,
      };
}
