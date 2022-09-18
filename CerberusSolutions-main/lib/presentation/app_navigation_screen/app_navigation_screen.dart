import 'controller/app_navigation_controller.dart';
import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:flutter/material.dart';

class AppNavigationScreen extends GetWidget<AppNavigationController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  width: size.width,
                  decoration: AppDecoration.fillWhiteA700,
                  child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: getPadding(left: 20, top: 10, right: 20, bottom: 10),
                            child: Text("lbl_app_navigation".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: AppStyle.txtRobotoRegular20.copyWith()))),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: getPadding(left: 20),
                            child: Text("msg_check_your_app".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: AppStyle.txtRobotoRegular16.copyWith()))),
                    Container(
                        height: getVerticalSize(1.00),
                        width: size.width,
                        margin: getMargin(top: 5),
                        decoration: BoxDecoration(color: ColorConstant.black900))
                  ])),
              Expanded(
                  child: Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                          child: Container(
                              decoration: AppDecoration.fillWhiteA700,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          //onTapTruyvetthatbai();
                                        },
                                        child: Container(
                                            width: size.width,
                                            decoration: AppDecoration.fillWhiteA700,
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Padding(
                                                          padding: getPadding(left: 20, top: 10, right: 20, bottom: 10),
                                                          child: Text("msg_truy_vet_that_b".tr,
                                                              overflow: TextOverflow.ellipsis,
                                                              textAlign: TextAlign.center,
                                                              style: AppStyle.txtRobotoRegular20Black900.copyWith()))),
                                                  Container(
                                                      height: getVerticalSize(1.00),
                                                      width: size.width,
                                                      margin: getMargin(top: 5),
                                                      decoration: BoxDecoration(color: ColorConstant.bluegray400))
                                                ]))),
                                    GestureDetector(
                                        onTap: () {
                                          onTapTruyvet();
                                        },
                                        child: Container(
                                            width: size.width,
                                            decoration: AppDecoration.fillWhiteA700,
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Padding(
                                                          padding: getPadding(left: 20, top: 10, right: 20, bottom: 10),
                                                          child: Text("lbl_truy_vet".tr,
                                                              overflow: TextOverflow.ellipsis,
                                                              textAlign: TextAlign.center,
                                                              style:
                                                                  AppStyle.txtRobotoRegular20Black90012.copyWith()))),
                                                  Container(
                                                      height: getVerticalSize(1.00),
                                                      width: size.width,
                                                      margin: getMargin(top: 5),
                                                      decoration: BoxDecoration(color: ColorConstant.bluegray400))
                                                ]))),
                                    GestureDetector(
                                        onTap: () {
                                          onTapTruyvetthanhcong();
                                        },
                                        child: Container(
                                            width: size.width,
                                            decoration: AppDecoration.fillWhiteA700,
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Padding(
                                                          padding: getPadding(left: 20, top: 10, right: 20, bottom: 10),
                                                          child: Text("msg_truy_vet_thanh".tr,
                                                              overflow: TextOverflow.ellipsis,
                                                              textAlign: TextAlign.center,
                                                              style:
                                                                  AppStyle.txtRobotoRegular20Black90012.copyWith()))),
                                                  Container(
                                                      height: getVerticalSize(1.00),
                                                      width: size.width,
                                                      margin: getMargin(top: 5),
                                                      decoration: BoxDecoration(color: ColorConstant.bluegray400))
                                                ]))),
                                    GestureDetector(
                                        onTap: () {
                                          onTapEKYC();
                                        },
                                        child: Container(
                                            width: size.width,
                                            decoration: AppDecoration.fillWhiteA700,
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Padding(
                                                          padding: getPadding(left: 20, top: 10, right: 20, bottom: 10),
                                                          child: Text("lbl_ekyc".tr,
                                                              overflow: TextOverflow.ellipsis,
                                                              textAlign: TextAlign.center,
                                                              style:
                                                                  AppStyle.txtRobotoRegular20Black90012.copyWith()))),
                                                  Container(
                                                      height: getVerticalSize(1.00),
                                                      width: size.width,
                                                      margin: getMargin(top: 5),
                                                      decoration: BoxDecoration(color: ColorConstant.bluegray400))
                                                ]))),
                                    GestureDetector(
                                        onTap: () {
                                          onTapHomeScreen();
                                        },
                                        child: Container(
                                            width: size.width,
                                            decoration: AppDecoration.fillWhiteA700,
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Padding(
                                                          padding: getPadding(left: 20, top: 10, right: 20, bottom: 10),
                                                          child: Text("lbl_home_screen".tr,
                                                              overflow: TextOverflow.ellipsis,
                                                              textAlign: TextAlign.center,
                                                              style:
                                                                  AppStyle.txtRobotoRegular20Black90012.copyWith()))),
                                                  Container(
                                                      height: getVerticalSize(1.00),
                                                      width: size.width,
                                                      margin: getMargin(top: 5),
                                                      decoration: BoxDecoration(color: ColorConstant.bluegray400))
                                                ])))
                                  ])))))
            ]))));
  }

  // onTapTruyvetthatbai() {
  //   Get.defaultDialog(
  //     title: '',
  //     content: TruyVetThatBaiDialog(
  //       Get.put(
  //         TruyVetThatBaiController(),
  //       ),
  //     ),
  //   );
  // }

  onTapTruyvet() {
    Get.toNamed(AppRoutes.trackingScreen);
  }

  onTapTruyvetthanhcong() {
    Get.toNamed(AppRoutes.trackingSuccessScreen);
  }

  onTapEKYC() {
    Get.toNamed(AppRoutes.ekycScreen);
  }

  onTapHomeScreen() {
    Get.toNamed(AppRoutes.homeScreen);
  }
}
