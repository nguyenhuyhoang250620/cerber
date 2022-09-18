import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/presentation/vms_screen/controller/vms_controller.dart';

import '../controller/vms_controller.dart';
import '../models/camerapreview_item_model.dart';
import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CamerapreviewItemWidget extends StatelessWidget {
  CamerapreviewItemWidget(this.camerapreviewItemModelObj);

  CamerapreviewItemModel camerapreviewItemModelObj;

  var controller = Get.find<VmsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomIconButton(
            height: getVerticalSize(50.00),
            width: getHorizontalSize(15.00),
            margin: getMargin(
              left: 2,
              right: 2,
            ),
            alignment: Alignment.centerRight,
            child: CommonImageView(
              width: 40,
              height: 40,
              //imagePath: 'assets/images/img_trash.png',
              svgPath: ImageConstant.imgTrash,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: getVerticalSize(
                300.00,
              ),
              width: getHorizontalSize(
                130.00,
              ),
              margin: getMargin(
                top: 1,
              ),
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                margin: EdgeInsets.all(0),
                color: ColorConstant.gray200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      3.73,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: getPadding(
                          left: 2,
                          top: 3,
                          right: 2,
                          bottom: 3,
                        ),
                        child: CommonImageView(
                          svgPath: ImageConstant.imgUser,
                          height: getSize(
                            60.00,
                          ),
                          width: getSize(
                            60.00,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: getPadding(
                top: 1,
                right: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "msg_cau_thang_ra_va".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterRegular373.copyWith(
                      height: 1.00,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 1,
                    ),
                    child: Text(
                      "lbl_camra_01".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterRegular373.copyWith(
                        height: 1.00,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
