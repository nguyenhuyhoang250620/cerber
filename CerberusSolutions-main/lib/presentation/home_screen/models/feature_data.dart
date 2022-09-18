import '../../../routes/app_routes.dart';

class FeatureData {
  static final data = [
    FeatureData(
        featureTitle: 'Nhận diện truy vết',
        featureDescription: 'Kiem soat description',
        routes: AppRoutes.trackingScreen,
        imagePath: 'assets/images/trackingfeature.png'),
    FeatureData(
        featureTitle: 'Định danh điện tử - eKYC',
        featureDescription: 'Kiem soat description',
        routes: AppRoutes.ekycScreen,
        imagePath: 'assets/images/ekycfeature.png'),
    FeatureData(
        featureTitle: 'Kiểm soát khu vực',
        featureDescription: 'Kiem soat description',
        routes: AppRoutes.trackingScreen,
        imagePath: 'assets/images/controllingarea.png'),
    FeatureData(
        featureTitle: 'Giám sát giao thông',
        featureDescription: 'Kiem soat description',
        routes: AppRoutes.trackingScreen,
        imagePath: 'assets/images/trafficmonitoring.png'),
    FeatureData(
        featureTitle: 'Các nghiệp vụ khác',
        featureDescription: 'Kiem soat description',
        routes: AppRoutes.trackingScreen,
        imagePath: 'assets/images/otheroption.png'),
  ];

  FeatureData(
      {required this.featureTitle, required this.featureDescription, required this.routes, required this.imagePath});
  final String featureTitle;
  final String featureDescription;
  final String routes;
  final String imagePath;

  String getFeatureTitle() {
    return featureTitle;
  }

  String getFeatureDescription() {
    return featureDescription;
  }

  String getRoutes() {
    return routes;
  }
}
