import 'package:cerberus_ai_system/presentation/ekyc_screen/controller/ekyc_controller.dart';
import 'package:cerberus_ai_system/presentation/ekyc_screen/ekyc_result_match_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_icon_button.dart';

class EkycChupGiayToThanhCongScreen extends GetWidget<EkycController> {
  const EkycChupGiayToThanhCongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: AppBar(
          backgroundColor: ColorConstant.whiteA700,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: ColorConstant.primaryIcon,
            onPressed: () {
              Get.back();
            },
          ),
          title: Text("msg_id_personal".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterMedium20.copyWith(height: 1.00)),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 9,
                //View Image Result
                child: Align(
                  alignment: Alignment.center,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      CommonImageView(
                        svgPath: ImageConstant.imgBackIDCard,
                        height: 30.h,
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(const EkycResultMatchScreen()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconButton(
                          height: 5.h,
                          width: 5.w,
                          child: CommonImageView(
                            svgPath: ImageConstant.imgCheckmark30X30,
                          ),
                        ),
                        Text(
                          "lbl_xong".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtInterRegular10.copyWith(),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(
                        height: 5.h,
                        width: 5.w,
                        child: CommonImageView(
                          svgPath: ImageConstant.imgCamera,
                        ),
                      ),
                      Text(
                        "lbl_ch_p_l_i".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterRegular10.copyWith(),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIconButton(
                        height: 5.h,
                        width: 5.w,
                        child: CommonImageView(
                          svgPath: ImageConstant.imgVector,
                        ),
                      ),
                      Text(
                        "lbl_ch_nh_s_a".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtInterRegular10.copyWith(),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
