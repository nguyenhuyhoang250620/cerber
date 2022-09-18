import 'cctv_model.dart';

class WebsocketCCTVEventModel {
  final CCTVModel data;
  final String event;

  WebsocketCCTVEventModel({required this.data, required this.event});

  factory WebsocketCCTVEventModel.fromJson(Map<String, dynamic> json) {
    return WebsocketCCTVEventModel(
        data: CCTVModel.fromJson(json['data'] ?? ""),
        event: json['event'] ?? "");
  }

  Map<String, dynamic> toJson() => {"data": data.toJson(), "event": event};
}
