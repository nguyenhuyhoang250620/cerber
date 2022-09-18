import 'package:get/get_connect/http/src/request/request.dart';

import '../controller/tracking_controller.dart';
import '../models/listfront_item_model.dart';
import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListfrontItemWidget extends StatelessWidget {
  ListfrontItemWidget(this.listfrontItemModelObj, this.onTap);

  ListfrontItemModel listfrontItemModelObj;
  final VoidCallback? onTap;

  var controller = Get.find<TrackingController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        margin: getMargin(top: 10),
        decoration: AppDecoration.fillWhiteA7007f.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder9,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: getPadding(
                //left: 20,
                top: 6,
                //right: 20,
              ),
              child: Text(
                listfrontItemModelObj.getId == 0
                    ? "lbl_front".tr
                    : "lbl_back".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterRegular18.copyWith(
                  height: 1.00,
                ),
              ),
            ),
            Container(
              width: getHorizontalSize(
                116.00,
              ),
              margin: getMargin(
                //left: 20,
                top: 21,
                //right: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    5.51,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(
                      left: 8,
                      right: 8,
                    ),
                    child: Text(
                      "msg_l_u_khi_ch_p".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterMedium14.copyWith(
                        height: 1.00,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 2,
                      top: 2,
                      right: 3,
                      bottom: 3,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            margin: getMargin(
                              top: 1,
                              bottom: 1,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 4,
                                      right: 3,
                                    ),
                                    child: CommonImageView(
                                      svgPath: ImageConstant.imgGroup5469,
                                      height: getVerticalSize(
                                        20.00,
                                      ),
                                      width: getHorizontalSize(
                                        23.00,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 2,
                                  ),
                                  child: Text(
                                    "msg_th_kh_ng_m_t_g".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.customtxtInterRegular345
                                        .copyWith(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: getMargin(
                              top: 1,
                              bottom: 1,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: getPadding(
                                    right: 1,
                                  ),
                                  child: CommonImageView(
                                    svgPath: ImageConstant.imgClock,
                                    height: getVerticalSize(
                                      13.00,
                                    ),
                                    width: getHorizontalSize(
                                      25.00,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 2,
                                    right: 1,
                                  ),
                                  child: Text(
                                    "lbl_kh_ng_lo_s_ng".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.customtxtInterRegular345
                                        .copyWith(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: getMargin(
                              right: 1,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CommonImageView(
                                  svgPath: ImageConstant.imgDownload,
                                  height: getVerticalSize(
                                    16.00,
                                  ),
                                  width: getHorizontalSize(
                                    29.00,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: getPadding(
                                      left: 1,
                                      top: 2,
                                      right: 1,
                                    ),
                                    child: Text(
                                      "msg_kh_ng_tay_ch".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.customtxtInterRegular345
                                          .copyWith(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 20,
                top: 21,
                right: 20,
              ),
              child: Text(
                "lbl_description".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterRegular10.copyWith(),
              ),
            ),
            Padding(
              padding: getPadding(
                //left: 20,
                top: 1,
                //right: 20,
                bottom: 7,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: CustomIconButton(
                      onTap: onTap, //thanhndh
                      height: 20,
                      width: 20,
                      padding: IconButtonPadding.PaddingAll5,
                      child: Image.asset('assets/images/upload_note_Image.png'),
                    ),
                  ),
                  Flexible(
                    child: CustomIconButton(
                      height: 20,
                      width: 20,
                      margin: getMargin(
                        left: 6,
                      ),
                      child: Image.asset('assets/images/take_note_picture.png'),
                      padding: IconButtonPadding.PaddingAll5,
                      onTap: () {
                        print('object');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
