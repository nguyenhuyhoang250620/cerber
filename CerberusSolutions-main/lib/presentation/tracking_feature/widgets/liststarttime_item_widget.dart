import 'package:cerberus_ai_system/widgets/platformwidgets.dart';

import '../controller/tracking_controller.dart';
import '../models/liststarttime_item_model.dart';
import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/widgets/custom_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListstarttimeItemWidget extends StatelessWidget {
  ListstarttimeItemWidget(this.liststarttimeItemModelObj);

  ListstarttimeItemModel liststarttimeItemModelObj;

  var controller = Get.find<TrackingController>();

  Widget ListstarttimeItemWidgetPC(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: getPadding(
          top: 6.529996,
          bottom: 6.529996,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(
                top: 6,
                bottom: 7,
              ),
              child: Text(
                "lbl_start_time".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterRegular20.copyWith(
                  height: 1.00,
                ),
              ),
            ),
            Flexible(
              child: CustomButton(
                width: 30,
                text: "lbl_08_00".tr,
              ),
            ),
            Flexible(
              child: CustomButton(
                width: 40,
                text: "lbl_29_08_2022".tr,
                // margin: getMargin(
                //   left: 7,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ListstarttimeItemWidgetMobile(BuildContext context) {
    return Padding(
      padding: getPadding(
          //top: 6.529996,
          //bottom: 6.529996,
          ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: getPadding(
                //top: 6,
                //bottom: 7,
                ),
            child: Text(
              "lbl_start_time".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterRegular14.copyWith(
                height: 1.00,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
                // left: 20,
                // top: 1,
                // bottom: 1,
                ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomButton(
                  width: 60,
                  text: "lbl_08_00".tr,
                ),
                CustomButton(
                  width: 100,
                  text: "lbl_29_08_2022".tr,
                  margin: getMargin(
                    left: 7,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidgets(
        androidBuilder: ListstarttimeItemWidgetMobile,
        iosBuilder: ListstarttimeItemWidgetMobile,
        macosBuilder: ListstarttimeItemWidgetPC,
        windowBuilder: ListstarttimeItemWidgetPC,
        linuxBuilder: ListstarttimeItemWidgetPC,
        webBuilder: ListstarttimeItemWidgetPC);
  }
}
