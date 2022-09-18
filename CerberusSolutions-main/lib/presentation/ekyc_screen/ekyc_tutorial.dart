import 'package:cerberus_ai_system/presentation/ekyc_screen/ekyc_chup_giay_to_screen.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_button.dart';
import 'controller/ekyc_controller.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EkycTutorialScreen extends GetWidget<EkycController> {
  const EkycTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: AppBar(
              title: Text("msg_id_personal".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtInterMedium20.copyWith(height: 1.00)),
              centerTitle: true,
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
            ),
            body: SizedBox(
                width: size.width,
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Padding(
                          padding: getPadding(left: 18, top: 49, right: 18),
                          child: CommonImageView(
                            imagePath: ImageConstant.imgEkyc2,
                            height: 12.h,
                          )),
                      Container(
                          width: double.infinity,
                          margin: getMargin(left: 18, top: 39, right: 13),
                          decoration:
                              AppDecoration.fillGray50.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: getPadding(left: 16, top: 21, right: 16),
                                        child: Text("msg_huong_dan_dinh_danh".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterMedium18.copyWith(height: 1.00)))),
                                Padding(
                                    padding: getPadding(left: 16, top: 10, right: 16),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                              padding: getPadding(bottom: 3),
                                              child: Text("lbl_step_1".tr,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtInterMedium14.copyWith(height: 1.00))),
                                          Padding(
                                              padding: getPadding(left: 10, top: 1),
                                              child: Text("msg_take_a_front_back_id_card".tr,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtInterMedium14.copyWith(height: 1.00)))
                                        ])),
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        width: double.infinity,
                                        margin: getMargin(left: 16, top: 8, right: 16),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(getHorizontalSize(12.92))),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              // Padding(
                                              //     padding: getPadding(
                                              //         left: 37, right: 37),
                                              //     child: Text(
                                              //         "msg_alert_while_take_picture_id_card"
                                              //             .tr,
                                              //         overflow:
                                              //             TextOverflow.ellipsis,
                                              //         textAlign: TextAlign.left,
                                              //         style: AppStyle
                                              //             .txtInterMedium14
                                              //             .copyWith(
                                              //                 height: 1.00))),
                                              Padding(
                                                  padding: getPadding(all: 5),
                                                  child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Column(
                                                            mainAxisSize: MainAxisSize.min,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              CommonImageView(
                                                                svgPath: ImageConstant.imgTicket,
                                                                height: 7.h,
                                                              ),
                                                              Align(
                                                                  alignment: Alignment.centerRight,
                                                                  child: Text("msg_dont_cover_a_hand".tr,
                                                                      overflow: TextOverflow.ellipsis,
                                                                      textAlign: TextAlign.center,
                                                                      style: AppStyle.txtInterRegular808.copyWith()))
                                                            ]),
                                                        Container(
                                                            margin: getMargin(top: 2),
                                                            child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  CommonImageView(
                                                                      svgPath: ImageConstant.imgSave, height: 7.h),
                                                                  Align(
                                                                      alignment: Alignment.centerLeft,
                                                                      child: Padding(
                                                                          padding: getPadding(top: 4),
                                                                          child: Text(
                                                                              "msg_id_card_dont_cover_corner".tr,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtInterRegular808
                                                                                  .copyWith())))
                                                                ])),
                                                        Container(
                                                            margin: getMargin(top: 7),
                                                            child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Align(
                                                                      alignment: Alignment.center,
                                                                      child: Padding(
                                                                          padding: getPadding(right: 1),
                                                                          child: CommonImageView(
                                                                            svgPath: ImageConstant.imgClock,
                                                                            height: 7.h,
                                                                          ))),
                                                                  Padding(
                                                                      padding: getPadding(top: 4),
                                                                      child: Text("lbl_havent_light".tr,
                                                                          overflow: TextOverflow.ellipsis,
                                                                          textAlign: TextAlign.left,
                                                                          style:
                                                                              AppStyle.txtInterRegular808.copyWith()))
                                                                ]))
                                                      ]))
                                            ]))),
                                Padding(
                                    padding: getPadding(left: 16, top: 10, right: 16),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                              padding: getPadding(bottom: 3),
                                              child: Text("lbl_step_2".tr,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtInterMedium14.copyWith(height: 1.00))),
                                          Padding(
                                              padding: getPadding(left: 10, top: 1),
                                              child: Text("lbl_take_a_portrait".tr,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtInterMedium14.copyWith(height: 1.00)))
                                        ])),
                                Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: getPadding(left: 16, top: 8, right: 16),
                                        child: Text("msg_alert_while_portrait".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterMedium14.copyWith(height: 1.00)))),
                                Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: getPadding(all: 10),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    CommonImageView(
                                                      svgPath: ImageConstant.imgPortraitDirectCamera,
                                                      height: 7.h,
                                                    ),
                                                    Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Padding(
                                                            padding: getPadding(top: 5),
                                                            child: Text("msg_capture_direct_camera".tr,
                                                                overflow: TextOverflow.ellipsis,
                                                                textAlign: TextAlign.left,
                                                                style: AppStyle.txtInterRegular805.copyWith())))
                                                  ]),
                                              Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                        padding: getPadding(left: 6, right: 8),
                                                        child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                            mainAxisSize: MainAxisSize.max,
                                                            children: [
                                                              CommonImageView(
                                                                svgPath: ImageConstant.imgNonGlasses,
                                                                height: 7.h,
                                                              ),
                                                            ])),
                                                    Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Padding(
                                                            padding: getPadding(top: 5),
                                                            child: Text("lbl_non_glasses".tr,
                                                                overflow: TextOverflow.ellipsis,
                                                                textAlign: TextAlign.left,
                                                                style: AppStyle.txtInterRegular805.copyWith())))
                                                  ])
                                            ]))),
                                Padding(
                                    padding: getPadding(left: 16, top: 15, right: 16, bottom: 18),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                              padding: getPadding(bottom: 1),
                                              child: Text("lbl_step_4".tr,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtInterMedium14.copyWith(height: 1.00))),
                                          Padding(
                                              padding: getPadding(left: 10, top: 1),
                                              child: Text("msg_tien_hanh_dinh_danh".tr,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtInterMedium14.copyWith(height: 1.00)))
                                        ]))
                              ])),
                      CustomButton(
                          onTap: () => _onTapNext(),
                          width: 20.w,
                          text: "lbl_start".tr,
                          margin: getMargin(left: 18, top: 45, right: 18, bottom: 20))
                    ])))));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}

_onTapNext() {
  Get.to(const EkycChupGiayToScreen());
}
