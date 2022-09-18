import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'core/app_export.dart';
import 'package:desktop_window/desktop_window.dart';

//thanhndh
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
  } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    fullScreenWindowsApp();
  }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

Future fullScreenWindowsApp() async {
  await DesktopWindow.setMinWindowSize(const Size(800, 900));
  await DesktopWindow.setFullScreen(true);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint('MyApp - Platform: $defaultTargetPlatform - kIsWeb - $kIsWeb');
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        defaultTransition: Transition.fadeIn,
        builder: (context, child) => ResponsiveWrapper.builder(child,
            maxWidth: 2460,
            minWidth: 375,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(375, name: MOBILE),
              const ResponsiveBreakpoint.resize(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1440, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
            ],
            background: Container(color: const Color(0xFFF5F5F5))),
        debugShowCheckedModeBanner: false,
        translations: AppLocalization(),
        locale: Get.deviceLocale, //for setting localization strings
        fallbackLocale: const Locale('en', 'US'),
        title: 'Cerberus Solution',
        initialBinding: InitialBindings(),
        initialRoute: AppRoutes.initialRoute,
        getPages: AppRoutes.pages,
      );
    });
  }
}
