import '../controller/home_controller.dart';
import '../models/sliderheaderads_item_model.dart';
import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/widgets/custom_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SliderheaderadsItemWidget extends StatelessWidget {
  SliderheaderadsItemWidget(this.sliderheaderadsItemModelObj, {Key? key}) : super(key: key);

  SliderheaderadsItemModel sliderheaderadsItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: AppDecoration.outlineQuangCao.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: getMargin(
                left: 16,
                top: 20,
                bottom: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: getPadding(
                      right: 10,
                    ),
                    child: Text(
                      "msg_quang_cao".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterMedium16.copyWith(
                        height: 1.00,
                      ),
                    ),
                  ),
                  Container(
                    width: getHorizontalSize(
                      165.00,
                    ),
                    margin: getMargin(
                      top: 9,
                    ),
                    child: Text(
                      "msg_subs_ads_lorem".tr,
                      maxLines: null,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterRegular14.copyWith(
                        height: 1.43,
                      ),
                    ),
                  ),
                  CustomButton(
                    width: 112,
                    text: "lbl_xem_chi_ti_t".tr,
                    margin: getMargin(
                      top: 15,
                      right: 10,
                    ),
                    variant: ButtonVariant.FillWhiteA700,
                    fontStyle: ButtonFontStyle.InterMedium14,
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 29,
                top: 30,
                right: 16,
                bottom: 30,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    16.00,
                  ),
                ),
                child: CommonImageView(
                  imagePath: ImageConstant.imgImage1,
                  height: getSize(
                    100.00,
                  ),
                  width: getSize(
                    100.00,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
