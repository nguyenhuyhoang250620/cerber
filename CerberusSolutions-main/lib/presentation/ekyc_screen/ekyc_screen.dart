import 'package:cerberus_ai_system/presentation/ekyc_screen/widget/Image_picker_widget.dart';
import 'package:cerberus_ai_system/widgets/common_home_scaffold.dart';
import 'package:cerberus_ai_system/widgets/custom_admin_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../core/app_export.dart';
import 'controller/ekyc_controller.dart';
import 'ekyc_result_match_screen.dart';
import 'widget/list_ekyc_item_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:play_kit/play_kit.dart';

// ignore: must_be_immutable
class EkycScreen extends GetWidget<EkycController> {
  const EkycScreen({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint('EkycScreen build');
    return CustomAdminScaffold(
      backgroundColor: ColorConstant.whiteA700,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: Text("msg_id_personal".tr,
      //       overflow: TextOverflow.ellipsis,
      //       textAlign: TextAlign.left,
      //       style: AppStyle.txtInterMedium20.copyWith(height: 1.00)),
      //   centerTitle: true,
      //   // backgroundColor: ColorConstant.whiteA700,
      //   // elevation: 0,
      //   // leading: IconButton(
      //   //   icon: Icon(
      //   //     Icons.camera,
      //   //     color: ColorConstant.black900,
      //   //   ),
      //   //   onPressed: () {
      //   //     Get.back();
      //   //   },
      //   // ),
      // ),
      pathImageBackground: 'assets/images/landingbackground.png',
      route: AppRoutes.ekycScreen,
      body: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: Container(
            child: Container(
          margin: const EdgeInsets.all(40),
          child: PlayContainer(
            borderRadius: BorderRadius.circular(30.0),
            height: Get.height,
            width: Get.width,
            dark: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Center(
                      child: Text("Định danh điện tử tử - eKYC",
                          style: AppStyle.txtInterMedium20
                              .copyWith(height: 1.00)
                              .apply(fontSizeFactor: 1.0))),
                ),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),

                          // dropdown below..
                          child: Obx((() => DropdownButton<String>(
                                value: controller.selectedType.value,
                                items: controller.typesEKYC
                                    .map((typeIdCard) =>
                                        DropdownMenuItem<String>(
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
                    flex: 7,
                    child: SingleChildScrollView(
                        child: Container(
                      height: Get.height,
                      width: Get.width,
                      child: ResponsiveRowColumn(
                        rowMainAxisAlignment: MainAxisAlignment.center,
                        rowCrossAxisAlignment: CrossAxisAlignment.start,
                        rowPadding: const EdgeInsets.all(10),
                        columnPadding: const EdgeInsets.all(10),
                        layout:
                            ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                                ? ResponsiveRowColumnType.COLUMN
                                : ResponsiveRowColumnType.ROW,
                        children: [
                          ResponsiveRowColumnItem(
                              rowFlex: 2,
                              child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: SizedBox(
                                    // fit: BoxFit.cover,
                                    child: PlayContainer(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        height: 60.h,
                                        width: 60.w,
                                        dark: false,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Text(
                                                "card_image".tr,
                                                style: AppStyle.txtInterMedium20
                                                    .copyWith(height: 1.0)
                                                    .apply(
                                                        fontSizeFactor:
                                                            ResponsiveWrapper.of(
                                                                        context)
                                                                    .isSmallerThan(
                                                                        DESKTOP)
                                                                ? 0.7
                                                                : 0.9),
                                              ),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.all(
                                                    ResponsiveWrapper.of(
                                                                context)
                                                            .isSmallerThan(
                                                                DESKTOP)
                                                        ? 0
                                                        : 30),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: Padding(
                                                            padding: EdgeInsets.all(
                                                                ResponsiveWrapper.of(
                                                                            context)
                                                                        .isSmallerThan(
                                                                            DESKTOP)
                                                                    ? 5
                                                                    : 10),
                                                            child:
                                                                PlayContainer(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30.0),
                                                                    height:
                                                                        40.h,
                                                                    width: Get
                                                                        .width,
                                                                    dark: false,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets.all(ResponsiveWrapper.of(context)
                                                                              .isSmallerThan(DESKTOP)
                                                                          ? 5
                                                                          : 10),
                                                                      child:
                                                                          Align(
                                                                        alignment:
                                                                            Alignment.topCenter,
                                                                        child:
                                                                            Obx(
                                                                          () =>
                                                                              ImagePickerWidget(
                                                                            group:
                                                                                1,
                                                                            title:
                                                                                "front".tr,
                                                                            pathSvgDefaltImage:
                                                                                ImageConstant.imgFrontIDCard,
                                                                            pathImageSelected:
                                                                                controller.pathFrontImage.value,
                                                                            cameraID:
                                                                                0,
                                                                            aspectRatio:
                                                                                const AspectRatio(aspectRatio: 1),
                                                                            controller:
                                                                                controller,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )))),
                                                    Expanded(
                                                        flex: 1,
                                                        child: Padding(
                                                          padding: EdgeInsets.all(
                                                              ResponsiveWrapper.of(
                                                                          context)
                                                                      .isSmallerThan(
                                                                          DESKTOP)
                                                                  ? 5
                                                                  : 10),
                                                          child: PlayContainer(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      30.0),
                                                              height: ResponsiveWrapper.of(
                                                                          context)
                                                                      .isSmallerThan(
                                                                          DESKTOP)
                                                                  ? ResponsiveWrapper.of(
                                                                              context)
                                                                          .isSmallerThan(
                                                                              TABLET)
                                                                      ? 20.h
                                                                      : 25.h
                                                                  : 40.h,
                                                              width: Get.width,
                                                              dark: false,
                                                              child: Padding(
                                                                padding: EdgeInsets.all(
                                                                    ResponsiveWrapper.of(context)
                                                                            .isSmallerThan(DESKTOP)
                                                                        ? 5
                                                                        : 10),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topCenter,
                                                                  child: Obx(
                                                                    () =>
                                                                        ImagePickerWidget(
                                                                      group: 1,
                                                                      title:
                                                                          "back"
                                                                              .tr,
                                                                      pathSvgDefaltImage:
                                                                          ImageConstant
                                                                              .imgBackIDCard,
                                                                      pathImageSelected: controller
                                                                          .pathBackImage
                                                                          .value,
                                                                      cameraID:
                                                                          1,
                                                                      aspectRatio:
                                                                          const AspectRatio(
                                                                              aspectRatio: 1),
                                                                      controller:
                                                                          controller,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )),
                                                        ))
                                                  ],
                                                ))
                                          ],
                                        )),
                                  ))),
                          ResponsiveRowColumnItem(
                              rowFlex: 1,
                              child: SizedBox(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: ResponsiveWrapper.of(context)
                                              .isSmallerThan(DESKTOP)
                                          ? 0
                                          : 30,
                                      top: ResponsiveWrapper.of(context)
                                              .isSmallerThan(TABLET)
                                          ? 30
                                          : 0),
                                  child: PlayContainer(
                                      borderRadius: BorderRadius.circular(30.0),
                                      height: ResponsiveWrapper.of(context)
                                              .isSmallerThan(DESKTOP)
                                          ? ResponsiveWrapper.of(context)
                                                  .isSmallerThan(TABLET)
                                              ? 35.h
                                              : 32.h
                                          : 60.h,
                                      width: ResponsiveWrapper.of(context)
                                              .isSmallerThan(DESKTOP)
                                          ? ResponsiveWrapper.of(context)
                                                  .isSmallerThan(TABLET)
                                              ? 60.w
                                              : 35.w
                                          : Get.width,
                                      dark: false,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                              "lbl_liveness".tr,
                                              style: AppStyle.txtInterMedium20
                                                  .copyWith(height: 1.0)
                                                  .apply(
                                                      fontSizeFactor:
                                                          ResponsiveWrapper.of(
                                                                      context)
                                                                  .isSmallerThan(
                                                                      DESKTOP)
                                                              ? 0.7
                                                              : 0.9),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(
                                                ResponsiveWrapper.of(context)
                                                        .isSmallerThan(DESKTOP)
                                                    ? 10
                                                    : 30),
                                            child: PlayContainer(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                height: ResponsiveWrapper.of(
                                                            context)
                                                        .isSmallerThan(DESKTOP)
                                                    ? ResponsiveWrapper.of(
                                                                context)
                                                            .isSmallerThan(
                                                                TABLET)
                                                        ? 25.h
                                                        : 23.5.h
                                                    : 40.h,
                                                width: Get.width,
                                                child: Padding(
                                                  padding: EdgeInsets.all(
                                                      ResponsiveWrapper.of(
                                                                  context)
                                                              .isSmallerThan(
                                                                  DESKTOP)
                                                          ? 5
                                                          : 10),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child: Obx(
                                                      () => ImagePickerWidget(
                                                        group: 2,
                                                        title: "front".tr,
                                                        pathSvgDefaltImage:
                                                            ImageConstant
                                                                .imgBackIDCard,
                                                        pathImageSelected:
                                                            controller
                                                                .pathPortraitImage
                                                                .value,
                                                        cameraID: 2,
                                                        aspectRatio:
                                                            const AspectRatio(
                                                                aspectRatio: 1),
                                                        controller: controller,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                          )
                                        ],
                                      )),
                                ),
                              ))
                        ],
                      ),
                    ))),
                Flexible(
                  flex: 1,
                  child: Center(
                      // padding: EdgeInsets.only(top: 2.h, left: 5.w, bottom: 0.h),
                      child: Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        debugPrint('TungVD: onTap');

                        controller.getEkycData(
                            "0",
                            Constants.company,
                            controller.pathFrontImage.value,
                            controller.pathBackImage.value,
                            controller.pathPortraitImage.value);

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0))),
                            backgroundColor: ColorConstant.gray200,
                            title: Obx(() => controller.isLoading
                                ? const Text("Đang xử lý...")
                                : const Text("Kết quả kiểm tra")),
                            content: Obx(
                              () => controller.isLoading
                                  ? Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: ColorConstant.gray200,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: LinearProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            ColorConstant.blue600),
                                      ),
                                    )
                                  : const EkycResultMatchScreen(),
                            ),
                            actions: <Widget>[
                              Center(
                                child: Obx(() => controller.isLoading
                                    ? Container()
                                    : Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                            TextButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors.white)),
                                                onPressed: () => Get.back(),
                                                child: const Text(
                                                  'Thử lại',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                )),
                                            TextButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors.blue)),
                                                onPressed: () => Get.back(),
                                                child: const Text('Hoàn thành',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white)))
                                          ])),
                              )
                            ],
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 5, top: 5),
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, top: 15, bottom: 15),
                        decoration: BoxDecoration(
                            color: ColorConstant.blue600,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text("lbl_start".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: AppStyle.txtInterMedium16Button
                                .copyWith()
                                .apply(
                                  fontSizeFactor: ResponsiveWrapper.of(context)
                                          .isSmallerThan(DESKTOP)
                                      ? ResponsiveWrapper.of(context)
                                              .isSmallerThan(TABLET)
                                          ? 1.0
                                          : 0.4
                                      : 1.0,
                                )),
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
