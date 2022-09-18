import 'package:cerberus_ai_system/presentation/area_controlling_screen/area_controlling_screen.dart';
import 'package:cerberus_ai_system/presentation/area_controlling_screen/binding/area_controlling_binding.dart';
import 'package:cerberus_ai_system/presentation/camera_preview/rtsp_camera.dart';
import 'package:cerberus_ai_system/presentation/ekyc_screen/ekyc_chup_giay_to_screen.dart';
import 'package:cerberus_ai_system/presentation/ekyc_screen/ekyc_chup_giay_to_thanh_cong_screen.dart';
import 'package:cerberus_ai_system/presentation/ekyc_screen/ekyc_result_match_screen.dart';
import 'package:cerberus_ai_system/presentation/ekyc_screen/ekyc_screen.dart';
import 'package:cerberus_ai_system/presentation/other_feature/binding/other_feature_binding.dart';
import 'package:cerberus_ai_system/presentation/other_feature/other_feature_screen.dart';
import 'package:cerberus_ai_system/presentation/support_screen/info_screen.dart';
import 'package:cerberus_ai_system/presentation/support_screen/introduction_screen.dart';
import 'package:cerberus_ai_system/presentation/support_screen/setting_screen.dart';
import 'package:cerberus_ai_system/presentation/support_screen/support_screen.dart';
import 'package:cerberus_ai_system/presentation/tracking_feature/binding/tracking_binding.dart';
import 'package:cerberus_ai_system/presentation/tracking_feature/binding/tracking_succes_binding.dart';
import 'package:cerberus_ai_system/presentation/tracking_feature/tracking_screen.dart';
import 'package:cerberus_ai_system/presentation/tracking_feature/tracking_succes_screen_pc.dart';
import 'package:cerberus_ai_system/presentation/tracking_feature/tracking_success_screen.dart';
import 'package:cerberus_ai_system/presentation/ekyc_screen/binding/ekyc_binding.dart';
import 'package:cerberus_ai_system/presentation/home_screen/home_screen.dart';
import 'package:cerberus_ai_system/presentation/home_screen/binding/home_binding.dart';
import 'package:cerberus_ai_system/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:cerberus_ai_system/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:cerberus_ai_system/presentation/traffic_monitoring_screen/binding/traffic_monitoring_binding.dart';
import 'package:cerberus_ai_system/presentation/traffic_monitoring_screen/traffic_monitoring_screen.dart';
import 'package:cerberus_ai_system/presentation/vms_screen/binding/vms_binding.dart';
import 'package:cerberus_ai_system/presentation/vms_screen/vms_screen.dart';
//import 'package:cerberus_ai_system/presentation/vms_screen/camerapreview.dart';
import 'package:get/get.dart';
import 'package:cerberus_ai_system/presentation/camera_preview/camera_screen.dart';
import 'package:cerberus_ai_system/presentation/camera_preview/camera_stream.dart';
import '../presentation/camera_preview/binding/camera_binding.dart';
import '../presentation/ekyc_screen/ekyc_tutorial.dart';
import '../presentation/camera_preview/camera_RTSP/single_tab.dart';

class AppRoutes {
  static const String trackingScreen = '/tracking_screen';

  static const String trackingSuccessScreen = '/tracking_success_screen';
  static const String trackingSuccessScreenPC = '/tracking_success_screen_pc';
  static const String ekycScreen = '/ekyc_screen';

  static const String homeScreen = '/home_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/ekyc_screen';
  static const String ekycTutorialScreen = '/ekyc_tutorial_screen';

  static const String ekycChupGiayTo = '/ekyc_chup_giay_to';

  static const String cameraPreview = '/camera_preview';
  static const String cameraStream = '/camera_stream';
  static const String cameraRTSP = '/camera_RTSP';

  static const String otherFeatureScreen = '/other_feature';
  static const String trafficMonitoring = '/traffic_monitoring';
  static const String areaControlling = '/area_controlling';

  static const String introductionApp = '/introduction';
  static const String aboutCerberus = '/about_cerberus';
  static const String settingScreen = '/setting_screen';
  static const String supportScreen = '/support_screen';
  static const String vmsScreen = '/vmsScreen';
  static const String ekycChinhSuaSauKhiChupGiayTo =
      '/ekyc_chinh_sua_sau_khi_chup_giay_to';
  static const String ekycResultMatchScreen =
      '/ekyc_chinh_sua_sau_khi_chup_giay_to';

  static List<GetPage> pages = [
    GetPage(
      name: introductionApp,
      page: () => const IntroductionScreen(),
    ),
    GetPage(
      name: aboutCerberus,
      page: () => const InfoScreen(),
    ),
    GetPage(
      name: settingScreen,
      page: () => const SettingScreen(),
    ),
    GetPage(
      name: supportScreen,
      page: () => const SupportScreen(),
    ),
    GetPage(
      name: trackingScreen,
      page: () => TrackingScreen(),
      bindings: [
        TrackingBinding(),
      ],
    ),
    GetPage(
      name: trackingSuccessScreen,
      page: () => TrackingSuccessScreen(),
      bindings: [
        TrackingSuccessBinding(),
      ],
    ),
    GetPage(
      name: vmsScreen,
      page: () => VmsScreen(),
      bindings: [
        VmsBinding(),
      ],
    ),
    GetPage(
      name: trackingSuccessScreenPC,
      page: () => const TrackingSuccessScreenPC(),
      bindings: [
        TrackingSuccessBinding(),
      ],
    ),
    GetPage(
      name: ekycScreen,
      page: () => const EkycScreen(),
      bindings: [
        EkycBinding(),
      ],
    ),
    GetPage(
      name: ekycTutorialScreen,
      page: () => const EkycTutorialScreen(),
      bindings: [
        EkycBinding(),
      ],
    ),
    GetPage(
      name: ekycChupGiayTo,
      page: () => const EkycChupGiayToScreen(),
      bindings: [
        EkycBinding(),
      ],
    ),
    GetPage(
      name: ekycChinhSuaSauKhiChupGiayTo,
      page: () => const EkycChupGiayToThanhCongScreen(),
      bindings: [
        EkycBinding(),
      ],
    ),
    GetPage(
      name: ekycResultMatchScreen,
      page: () => const EkycResultMatchScreen(),
      bindings: [
        EkycBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => const HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(name: cameraPreview, page: () => CameraScreen(), bindings: [
      ScanBinding(),
    ]),
    GetPage(name: cameraStream, page: () => CameraStream(), bindings: [
      ScanBinding(),
    ]),
    GetPage(
      name: cameraRTSP,
      page: () => CameraRTSP(),
      // bindings: [
      //   RTSPBinding(),
      // ]
    ),
    GetPage(
      name: areaControlling,
      page: () => const AreaControllingScreen(),
      bindings: [
        AreaControllingBinding(),
      ],
    ),
    GetPage(
      name: trafficMonitoring,
      page: () => const TrafficMonitoringScreen(),
      bindings: [
        TrafficMonitoringBinding(),
      ],
    ),
    GetPage(
      name: otherFeatureScreen,
      page: () => const OtherFeatureScreen(),
      bindings: [
        OtherFeatureBinding(),
      ],
    ),
  ];
}
