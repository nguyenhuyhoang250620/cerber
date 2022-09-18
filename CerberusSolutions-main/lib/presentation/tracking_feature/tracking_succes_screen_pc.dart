import 'package:cerberus_ai_system/presentation/tracking_feature/controller/tracking_controller.dart';

import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/widgets/customtrackingresult.dart';
import 'package:cerberus_ai_system/widgets/customtrackingscreen.dart';
import 'package:cerberus_ai_system/widgets/custom_button.dart';
import 'package:cerberus_ai_system/widgets/platformwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TrackingSuccessScreenPC extends GetWidget<TrackingController> {
  const TrackingSuccessScreenPC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: CustomTrackingResult(),
    );
  }
}
