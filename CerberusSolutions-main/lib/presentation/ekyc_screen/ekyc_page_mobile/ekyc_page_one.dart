import 'package:cerberus_ai_system/presentation/ekyc_screen/widget/Image_picker_widget.dart';
import 'package:cerberus_ai_system/widgets/common_home_scaffold.dart';
import 'package:cerberus_ai_system/widgets/custom_admin_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../core/app_export.dart';
import '../controller/ekyc_controller.dart';
import '../ekyc_result_match_screen.dart';
import '../widget/list_ekyc_item_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:play_kit/play_kit.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

// ignore: must_be_immutable
class EkycScreenMobile extends GetWidget<EkycController> {
  const EkycScreenMobile({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint('EkycScreen build');
    return CustomAdminScaffold(
      backgroundColor: ColorConstant.whiteA700,
      pathImageBackground: 'assets/images/Landing.png',
      route: AppRoutes.ekycScreen,
      body: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/ekyc_background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.all(20),
              child: PlayContainer(
                borderRadius: BorderRadius.circular(30.0),
                height: Get.height,
                width: Get.width,
                dark: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Text("Định danh điện tử tử - eKYC",
                                  style: AppStyle.txtInterMedium20.copyWith(height: 1.00).apply(fontSizeFactor: 1.0))),
                        )),
                    Flexible(
                      flex: 1,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              fit: FlexFit.loose,
                              // padding: getPadding(right: 0),
                              child: Text(
                                'Chọn loại giấy tờ: ',
                                style: AppStyle.txtInterMedium14PrimaryText
                                    .copyWith(height: 1.00)
                                    .apply(fontSizeFactor: 1.0),
                              ),
                            ),
                            //dropdown menu
                            Container(
                              height: 5.h,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),

                              // dropdown below..
                              child: Obx((() => DropdownButton<String>(
                                    value: controller.selectedType.value,
                                    items: controller.typesEKYC
                                        .map((typeIdCard) => DropdownMenuItem<String>(
                                              value: typeIdCard,
                                              child: Text(
                                                typeIdCard,
                                                style: AppStyle.txtInterMedium11
                                                    .copyWith(height: 1.00)
                                                    .apply(fontSizeFactor: 1.0),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      controller.selectedType.value = value!;
                                    },
                                  ))),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 8,
                      child: PlayContainer(
                          borderRadius: BorderRadius.circular(30.0),
                          height: Get.height,
                          width: Get.width,
                          dark: false,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Obx(
                                () => ImagePickerWidget(
                                  group: 1,
                                  title: "lbl_front".tr,
                                  pathSvgDefaltImage: ImageConstant.imgFrontIDCard,
                                  pathImageSelected: controller.pathFrontImage.value,
                                  cameraID: 0,
                                  aspectRatio: const AspectRatio(aspectRatio: 1),
                                  controller: controller,
                                ),
                              ),
                            ),
                          )),
                    ),
                    Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 5, top: 5),
                          padding: const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
                          decoration:
                              BoxDecoration(color: ColorConstant.blue600, borderRadius: BorderRadius.circular(15)),
                          child: Text("lbl_next".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtInterMedium16Button.copyWith().apply(
                                    fontSizeFactor: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                                        ? ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                                            ? 1.0
                                            : 0.4
                                        : 1.0,
                                  )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
