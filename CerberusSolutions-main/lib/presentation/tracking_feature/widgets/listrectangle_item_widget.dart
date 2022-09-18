import '../controller/tracking_success_controller.dart';
import '../models/listrectangle_item_model.dart';
import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListrectangleItemWidget extends StatelessWidget {
  ListrectangleItemWidget(this.listrectangleItemModelObj);

  ListrectangleItemModel listrectangleItemModelObj;

  var controller = Get.find<TrackingSuccessController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(
        top: 2.5,
        bottom: 2.5,
      ),
      decoration: AppDecoration.fillWhiteA7007f.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Container(
                height: getSize(
                  60.00,
                ),
                width: getSize(
                  60.00,
                ),
                margin: getMargin(
                  left: 2,
                  top: 12,
                  bottom: 12,
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.red300,
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      2.00,
                    ),
                  ),
                ),
              ),
              Container(
                margin: getMargin(
                  left: 2,
                  top: 20,
                  //right: 12,
                  bottom: 18,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: getPadding(
                        right: 10,
                      ),
                      child: Text(
                        "lbl_time".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterRegular16.copyWith(
                          height: 1.00,
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 14,
                        right: 10,
                      ),
                      child: Text(
                        "lbl_place".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterRegular16.copyWith(
                          height: 1.00,
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 28,
                        right: 10,
                      ),
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: getPadding(
                //left: 50,
                top: 12,
                right: 12,
                bottom: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "lbl_view_detail".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtInterRegular14.copyWith(),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 2,
                      top: 1,
                      bottom: 2,
                    ),
                    child: CommonImageView(
                      svgPath: ImageConstant.imgFile,
                      height: getSize(
                        6.00,
                      ),
                      width: getSize(
                        6.00,
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
