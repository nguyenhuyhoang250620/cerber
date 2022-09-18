import 'dart:io';

import 'package:cerberus_ai_system/presentation/ekyc_screen/controller/ekyc_controller.dart';
import 'package:cerberus_ai_system/presentation/ekyc_screen/widget/Image_picker_widget.dart';
import 'package:cerberus_ai_system/presentation/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_button.dart';
import 'widget/list_ekyc_item_widget.dart';

class EkycResultMatchScreen extends GetWidget<EkycController> {
  const EkycResultMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1.w),
            border: Border.all(color: ColorConstant.gray200, width: 1),
            color: ColorConstant.gray200),
        child: SizedBox(
          width: 50.w,
          height: 72.h,
          child: Padding(
            padding: getPadding(all: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.cover,
                      child: Container(
                          height: ResponsiveWrapper.of(context)
                                  .isSmallerThan(TABLET)
                              ? 0.h
                              : 13.h,
                          width: ResponsiveWrapper.of(context)
                                  .isSmallerThan(TABLET)
                              ? 8.w
                              : 10.w,
                          child: Wrap(
                            children: [
                              AspectRatio(
                                  // borderRadius: BorderRadius.circular(10.0),
                                  aspectRatio: 85 / 53,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.file(
                                      File(controller.pathFrontImage.value),
                                      // height: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 10.h : 20.h,
                                      // width: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 10.w : 20.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ))
                            ],
                          )),
                    ),
                    FittedBox(
                      fit: BoxFit.cover,
                      child: Container(
                          height: ResponsiveWrapper.of(context)
                                  .isSmallerThan(TABLET)
                              ? 0.h
                              : 13.h,
                          width: ResponsiveWrapper.of(context)
                                  .isSmallerThan(TABLET)
                              ? 8.w
                              : 10.w,
                          child: Wrap(
                            children: [
                              AspectRatio(
                                  // borderRadius: BorderRadius.circular(10.0),
                                  aspectRatio: 85 / 53,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.file(
                                      File(controller.pathBackImage.value),
                                      // height: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 10.h : 20.h,
                                      // width: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 10.w : 20.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ))
                            ],
                          )),
                    ),
                    FittedBox(
                      fit: BoxFit.cover,
                      child: Container(
                          height: ResponsiveWrapper.of(context)
                                  .isSmallerThan(TABLET)
                              ? 0.h
                              : 13.h,
                          width: ResponsiveWrapper.of(context)
                                  .isSmallerThan(TABLET)
                              ? 8.w
                              : 8.w,
                          child: Wrap(
                            children: [
                              AspectRatio(
                                  // borderRadius: BorderRadius.circular(10.0),
                                  aspectRatio: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.file(
                                      File(controller.pathPortraitImage.value),
                                      // height: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 10.h : 20.h,
                                      // width: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 10.w : 20.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ))
                            ],
                          )),
                    ),

                    // Image.file(
                    //   File(controller.pathBackImage.value),
                    //   height: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)?5.h:10.h,
                    // ),
                    // Image.file(
                    //   File(controller.pathPortraitImage.value),
                    //   height: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)?5.h:10.h,
                    // ),

                    // CommonImageView(
                    //   svgPath: ImageConstant.imgFrontIDCard,
                    //   imagePath: controller.pathBackImage.value,
                    //   height: 5.h,
                    // ),
                    // CommonImageView(
                    //   svgPath: ImageConstant.imgBackIDCard,
                    //   imagePath: controller.pathBackImage.value,
                    //   height: 5.h,
                    // ),
                    // CommonImageView(
                    //   svgPath: ImageConstant.imgFrontIDCard,
                    //   imagePath: controller.pathPortraitImage.value,
                    //   height: 5.h,
                    // ),
                  ],
                ),
                Padding(
                  padding: getPadding(
                      top: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                          ? 0
                          : 20),
                  child: SizedBox(
                    width: 100.w,
                    child: Column(
                      children: [
                        ListEKYCItemWidget(
                            controller.ekycModel.tFaceLiveness,
                            true,
                            controller.ekycModel.faceLiveness
                                ? "matching".tr
                                : "not_suitable".tr),
                        ListEKYCItemWidget(
                            controller.ekycModel.tFaceCompare,
                            true,
                            controller.ekycModel.faceCompare
                                ? "matching".tr
                                : "not_suitable".tr),

                        Text("msg_card_informatio".tr),
                        ListEKYCItemWidget(controller.ekycModel.tIdNumber,
                            false, controller.ekycModel.idNumber),
                        ListEKYCItemWidget(controller.ekycModel.tName, false,
                            controller.ekycModel.name),
                        ListEKYCItemWidget(controller.ekycModel.tDob, false,
                            controller.ekycModel.dob),
                        ListEKYCItemWidget(controller.ekycModel.tHometown,
                            false, controller.ekycModel.hometown),
                        ListEKYCItemWidget(controller.ekycModel.tAddress, false,
                            controller.ekycModel.address),
                        ListEKYCItemWidget(controller.ekycModel.tDate, false,
                            controller.ekycModel.date),
                        ListEKYCItemWidget(controller.ekycModel.tLocation,
                            false, controller.ekycModel.location),
                        // ListEKYCItemWidget(controller.ekycModel.tFaceMask, false, controller.ekycModel.faceMask),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  onTapImgArrowleft() {
    Get.back();
  }
}
