import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/presentation/ekyc_screen/controller/ekyc_controller.dart';
import 'package:cerberus_ai_system/presentation/ekyc_screen/ekyc_chup_giay_to_thanh_cong_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EkycChupGiayToScreen extends GetWidget<EkycController> {
  const EkycChupGiayToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstant.whiteA700,
          appBar: AppBar(
            backgroundColor: ColorConstant.whiteA700,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: ColorConstant.primaryIcon,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            title: Text(
              "msg_id_personal".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterMedium20.copyWith(
                height: 1.00,
              ),
            ),
          ),
          body: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                // Align(
                //   alignment: Alignment.topCenter,
                //   child: Container(),
                // ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CommonImageView(
                            svgPath: ImageConstant.imgFrontIDCard,
                            height: 10.h,
                          ),
                          Text(
                            "lbl_mat_truoc".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterRegular10Gray900.copyWith(),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: getPadding(
                              left: 19,
                              top: 21,
                              bottom: 36,
                            ),
                            child: CommonImageView(
                              svgPath: ImageConstant.imgArrowrightGray900,
                              height: 4.h,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CommonImageView(
                              svgPath: ImageConstant.imgBackIDCard,
                              height: 10.h,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 29,
                              top: 3,
                              right: 28,
                            ),
                            child: Text(
                              "lbl_mat_sau".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterRegular10Gray900.copyWith(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const EkycChupGiayToThanhCongScreen());
                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: getSize(
                        70.00,
                      ),
                      width: getSize(
                        70.00,
                      ),
                      margin: getMargin(bottom: 5.h),
                      decoration: BoxDecoration(
                        color: ColorConstant.primaryBackground,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            35.00,
                          ),
                        ),
                        border: Border.all(
                          width: getHorizontalSize(
                            3.00,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: getMargin(left: 5.w, bottom: 5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(
                          top: 34,
                          bottom: 21,
                        ),
                        child: Text(
                          "lbl_gallery".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtInterMedium14Black900.copyWith(
                            height: 1.00,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
