import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformWidgets extends StatelessWidget {
  const PlatformWidgets(
      {Key? key,
      required this.androidBuilder,
      required this.iosBuilder,
      required this.macosBuilder,
      required this.windowBuilder,
      required this.linuxBuilder,
      required this.webBuilder})
      : super(key: key);
  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;
  final WidgetBuilder macosBuilder;
  final WidgetBuilder windowBuilder;
  final WidgetBuilder linuxBuilder;
  final WidgetBuilder webBuilder;
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return webBuilder(context);
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return androidBuilder(context);
        case TargetPlatform.iOS:
          return iosBuilder(context);
        case TargetPlatform.macOS:
          return macosBuilder(context);
        case TargetPlatform.windows:
          return macosBuilder(context);
        case TargetPlatform.linux:
          return macosBuilder(context);
        default:
          assert(false, 'Unexpected platform $defaultTargetPlatform');
          return const SizedBox.shrink();
      }
    }
  }
}
