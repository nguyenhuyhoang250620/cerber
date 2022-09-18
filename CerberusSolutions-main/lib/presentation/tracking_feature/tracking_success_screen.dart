import 'package:cerberus_ai_system/presentation/tracking_feature/controller/tracking_controller.dart';
import 'package:cerberus_ai_system/widgets/custom_admin_scaffold.dart';
import 'package:cerberus_ai_system/widgets/platformwidgets.dart';
//import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import '../tracking_feature/widgets/listrectangle_item_widget.dart';
import 'controller/tracking_success_controller.dart';
import 'models/listrectangle_item_model.dart';
import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UiTrackingSuccessScreen extends StatefulWidget {
  const UiTrackingSuccessScreen({Key? key}) : super(key: key);

  @override
  State<UiTrackingSuccessScreen> createState() =>
      _UiTrackingSuccessScreenState();
}

class _UiTrackingSuccessScreenState extends State<UiTrackingSuccessScreen> {
  //final trackingSuccessController = Get.find<TrackingSuccessController>();
  final trackingController = Get.find<TrackingController>();

  Widget UiTrackingSuccessScreenPC(BuildContext context) {
    return CustomAdminScaffold(
        route: AppRoutes.trackingSuccessScreen,
        pathImageBackground: 'assets/images/img_mesadetrabajo.png',
        body: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Container(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                Flexible(
                    flex: 1,
                    child: Center(
                      child: Container(
                          width: size.width,
                          margin: getMargin(left: 2, right: 1, bottom: 10),
                          child: Container(
                              child: Padding(
                                  padding:
                                      getPadding(left: 2, top: 27, right: 2),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: GestureDetector(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: Padding(
                                                  padding: getPadding(
                                                      top: 1, bottom: 10),
                                                  child: CommonImageView(
                                                      svgPath: ImageConstant
                                                          .imgArrowleft,
                                                      height: getVerticalSize(
                                                          20.00),
                                                      width: getHorizontalSize(
                                                          10.00)))),
                                        ),
                                        Text("msg_truy_v_t_i_t".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtInterMedium20
                                                .copyWith(height: 1.00)),
                                        SizedBox()
                                      ])))),
                    )),
                Flexible(
                    flex: 9,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Container(
                          child: ResponsiveRowColumn(
                            rowMainAxisAlignment: MainAxisAlignment.center,
                            rowCrossAxisAlignment: CrossAxisAlignment.start,
                            layout: ResponsiveWrapper.of(context)
                                    .isSmallerThan(DESKTOP)
                                ? ResponsiveRowColumnType.COLUMN
                                : ResponsiveRowColumnType.ROW,
                            children: [
                              ResponsiveRowColumnItem(
                                  rowFlex: 2,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 20),
                                      width: ResponsiveWrapper.of(context)
                                              .isSmallerThan(DESKTOP)
                                          ? 100.w
                                          : 40.w,
                                      height: ResponsiveWrapper.of(context)
                                              .isSmallerThan(DESKTOP)
                                          ? 85.h
                                          : 85.h,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: AppDecoration
                                                .fillWhiteA7007f
                                                .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder16,
                                            ),
                                            child: Obx(
                                              () => Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding: getPadding(
                                                        //left: 24,
                                                        top: 20,
                                                        //right: 24,
                                                      ),
                                                      child: Text(
                                                        "lbl_infor".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtInterRegular18
                                                            .copyWith(
                                                          height: 1.00,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                      padding: getPadding(
                                                        left: 2,
                                                        top: 12,
                                                        right: 2,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            height: getSize(
                                                              60.00,
                                                            ),
                                                            width: getSize(
                                                              60.00,
                                                            ),
                                                            margin: getMargin(
                                                              top: 4,
                                                              bottom: 12,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  ColorConstant
                                                                      .red300,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                getHorizontalSize(
                                                                  2.00,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: getMargin(
                                                              left: 2,
                                                              top: 2,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start, //
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      getPadding(
                                                                    right: 10,
                                                                  ),
                                                                  child: Text(
                                                                    "lbl_id".tr +
                                                                        ' ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.soCmt}',
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtInterRegular16
                                                                        .copyWith(
                                                                      height:
                                                                          1.00,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      getPadding(
                                                                    top: 14,
                                                                    right: 10,
                                                                  ),
                                                                  child: Text(
                                                                    "lbl_name"
                                                                            .tr +
                                                                        ' ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.hoVaTen}',
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtInterRegular16
                                                                        .copyWith(
                                                                      height:
                                                                          1.00,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      getPadding(
                                                                    top: 13,
                                                                    right: 2,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            getPadding(
                                                                          top:
                                                                              1,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          "lbl_birthday".tr +
                                                                              ' ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.namSinh}',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          textAlign:
                                                                              TextAlign.left,
                                                                          style: AppStyle
                                                                              .txtInterRegular16
                                                                              .copyWith(
                                                                            height:
                                                                                1.00,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            getPadding(
                                                                          left:
                                                                              2,
                                                                          top:
                                                                              1,
                                                                          right:
                                                                              2,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          "lbl_gender".tr +
                                                                              ' ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.gioiTinh}',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          textAlign:
                                                                              TextAlign.left,
                                                                          style: AppStyle
                                                                              .txtInterRegular16
                                                                              .copyWith(
                                                                            height:
                                                                                1.00,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                      left: 2,
                                                      top: 12,
                                                      right: 2,
                                                    ),
                                                    child: Text(
                                                      "lbl_nationality".tr +
                                                          ' ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.quocTich}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterRegular16
                                                          .copyWith(
                                                        height: 1.00,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                      left: 2,
                                                      top: 12,
                                                      right: 2,
                                                    ),
                                                    child: Text(
                                                      "lbl_address".tr +
                                                          ' ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.noiTru}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterRegular16
                                                          .copyWith(
                                                        height: 1.00,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                      left: 2,
                                                      top: 12,
                                                      right: 2,
                                                      bottom: 17,
                                                    ),
                                                    child: Text(
                                                      "lbl_birth_place".tr +
                                                          ' ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.noiTru}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterRegular16
                                                          .copyWith(
                                                        height: 1.00,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding: getPadding(
                                                //left: 141,
                                                top: 34,
                                                //right: 141,
                                              ),
                                              child: Text(
                                                "lbl_results".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtInterRegular16
                                                    .copyWith(
                                                  height: 1.00,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: getPadding(
                                              top: 8,
                                              bottom: 25,
                                            ),
                                            child: Obx(
                                              () => ListView.builder(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: trackingController
                                                    .frame34663ModelObj
                                                    .value
                                                    .listrectangle4481ItemList
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  ListrectangleItemModel model =
                                                      trackingController
                                                              .frame34663ModelObj
                                                              .value
                                                              .listrectangle4481ItemList[
                                                          index];
                                                  return ListrectangleItemWidget(
                                                    model,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                              ResponsiveRowColumnItem(
                                  rowFlex: 3,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Container(
                                        width: ResponsiveWrapper.of(context)
                                                .isSmallerThan(DESKTOP)
                                            ? 100.w
                                            : 60.w,
                                        height: ResponsiveWrapper.of(context)
                                                .isSmallerThan(DESKTOP)
                                            ? 85.h
                                            : 85.h,
                                        padding: EdgeInsets.only(left: 20),
                                        // decoration: AppDecoration.outlineBlack9003f
                                        //     .copyWith(
                                        //         borderRadius: BorderRadiusStyle
                                        //             .roundedBorder16),
                                        // decoration: AppDecoration.fillWhiteA7007f.copyWith(
                                        //     borderRadius:
                                        //         BorderRadiusStyle.roundedBorder16),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: getVerticalSize(
                                                520.00,
                                              ),
                                              width: getHorizontalSize(
                                                300.00,
                                              ),
                                              margin: getMargin(
                                                left: 2,
                                                right: 2,
                                              ),
                                              decoration: BoxDecoration(
                                                color: ColorConstant.indigo200,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  getHorizontalSize(
                                                    16.00,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(
                                                left: 2,
                                                top: 28,
                                                right: 12,
                                                //bottom: 391,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    height: getVerticalSize(
                                                      19.00,
                                                    ),
                                                    width: getHorizontalSize(
                                                      17.00,
                                                    ),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                            height:
                                                                getVerticalSize(
                                                              19.00,
                                                            ),
                                                            width:
                                                                getHorizontalSize(
                                                              17.00,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorConstant
                                                                  .indigo80099,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                getHorizontalSize(
                                                                  19.00,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding: getPadding(
                                                              left: 1,
                                                              top: 1,
                                                              right: 1,
                                                              bottom: 1,
                                                            ),
                                                            child:
                                                                CommonImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgCooli,
                                                              height:
                                                                  getVerticalSize(
                                                                7.00,
                                                              ),
                                                              width:
                                                                  getHorizontalSize(
                                                                9.00,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: getVerticalSize(
                                                      19.00,
                                                    ),
                                                    width: getHorizontalSize(
                                                      17.00,
                                                    ),
                                                    margin: getMargin(
                                                      left: 17,
                                                    ),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                            height:
                                                                getVerticalSize(
                                                              19.00,
                                                            ),
                                                            width:
                                                                getHorizontalSize(
                                                              17.00,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorConstant
                                                                  .indigo80099,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                getHorizontalSize(
                                                                  19.00,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding: getPadding(
                                                                //left: 8,
                                                                //top: 9,
                                                                //right: 8,
                                                                //bottom: 9,
                                                                ),
                                                            child:
                                                                CommonImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgVolume,
                                                              height:
                                                                  getVerticalSize(
                                                                12.00,
                                                              ),
                                                              width:
                                                                  getHorizontalSize(
                                                                9.00,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: getVerticalSize(
                                                      19.00,
                                                    ),
                                                    width: getHorizontalSize(
                                                      17.00,
                                                    ),
                                                    margin: getMargin(
                                                      left: 17,
                                                    ),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                            height:
                                                                getVerticalSize(
                                                              19.00,
                                                            ),
                                                            width:
                                                                getHorizontalSize(
                                                              17.00,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorConstant
                                                                  .indigo80099,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                getHorizontalSize(
                                                                  19.00,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding: getPadding(
                                                                // left: 8,
                                                                // top: 9,
                                                                // right: 8,
                                                                // bottom: 9,
                                                                ),
                                                            child:
                                                                CommonImageView(
                                                              svgPath: ImageConstant
                                                                  .imgCooliconWhiteA700,
                                                              height:
                                                                  getVerticalSize(
                                                                12.00,
                                                              ),
                                                              width:
                                                                  getHorizontalSize(
                                                                9.00,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: getVerticalSize(
                                                      19.00,
                                                    ),
                                                    width: getHorizontalSize(
                                                      17.00,
                                                    ),
                                                    margin: getMargin(
                                                      left: 17,
                                                    ),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                            height:
                                                                getVerticalSize(
                                                              19.00,
                                                            ),
                                                            width:
                                                                getHorizontalSize(
                                                              17.00,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorConstant
                                                                  .indigo80099,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                getHorizontalSize(
                                                                  19.00,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding: getPadding(
                                                                // left: 10,
                                                                // top: 13,
                                                                // right: 8,
                                                                // bottom: 13,
                                                                ),
                                                            child:
                                                                CommonImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgCoolicon,
                                                              height:
                                                                  getVerticalSize(
                                                                5.00,
                                                              ),
                                                              width:
                                                                  getHorizontalSize(
                                                                6.00,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: getVerticalSize(
                                                      19.00,
                                                    ),
                                                    width: getHorizontalSize(
                                                      17.00,
                                                    ),
                                                    margin: getMargin(
                                                      left: 17,
                                                    ),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                            height:
                                                                getVerticalSize(
                                                              19.00,
                                                            ),
                                                            width:
                                                                getHorizontalSize(
                                                              17.00,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorConstant
                                                                  .indigo80099,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                getHorizontalSize(
                                                                  19.00,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding: getPadding(
                                                                //all: 9,
                                                                ),
                                                            child:
                                                                CommonImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgMaximize,
                                                              height:
                                                                  getVerticalSize(
                                                                12.00,
                                                              ),
                                                              width:
                                                                  getHorizontalSize(
                                                                9.00,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }

  Widget UiTrackingSuccessScreenMobile(BuildContext context) {
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: AppDecoration.fillWhiteA700,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CommonImageView(
                            imagePath: ImageConstant.imgMesadetrabajo,
                            height: getVerticalSize(900.00),
                            width: getHorizontalSize(400.00))),
                    Container(
                      width: double.infinity,
                      //height: size.height,
                      child: Column(
                        children: [
                          Expanded(flex: 1, child: Text('')),
                          Expanded(
                            flex: 9,
                            child: SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            //padding: EdgeInsets.only(left: 2,right: 2),
                                            width: double.infinity,
                                            decoration: AppDecoration
                                                .fillWhiteA7007f
                                                .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder16,
                                            ),
                                            child: Obx(
                                              () => Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding: getPadding(
                                                        //left: 24,
                                                        top: 20,
                                                        //right: 24,
                                                      ),
                                                      child: Text(
                                                        "lbl_infor".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtInterRegular18
                                                            .copyWith(
                                                          height: 1.00,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                      padding: getPadding(
                                                        left: 2,
                                                        top: 12,
                                                        right: 2,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            height: getSize(
                                                              60.00,
                                                            ),
                                                            width: getSize(
                                                              60.00,
                                                            ),
                                                            margin: getMargin(
                                                              top: 4,
                                                              bottom: 12,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  ColorConstant
                                                                      .red300,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                getHorizontalSize(
                                                                  2.00,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: getMargin(
                                                              left: 2,
                                                              top: 2,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start, //
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      getPadding(
                                                                    right: 10,
                                                                  ),
                                                                  child: Text(
                                                                    "lbl_id".tr +
                                                                        ' ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.soCmt}',
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtInterRegular16
                                                                        .copyWith(
                                                                      height:
                                                                          1.00,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      getPadding(
                                                                    top: 14,
                                                                    right: 10,
                                                                  ),
                                                                  child: Text(
                                                                    "lbl_name"
                                                                            .tr +
                                                                        ' ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.hoVaTen}',
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .txtInterRegular16
                                                                        .copyWith(
                                                                      height:
                                                                          1.00,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      getPadding(
                                                                    top: 13,
                                                                    right: 2,
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            getPadding(
                                                                          top:
                                                                              1,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          "lbl_birthday".tr +
                                                                              ' ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.namSinh}',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          textAlign:
                                                                              TextAlign.left,
                                                                          style: AppStyle
                                                                              .txtInterRegular16
                                                                              .copyWith(
                                                                            height:
                                                                                1.00,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            getPadding(
                                                                          left:
                                                                              2,
                                                                          top:
                                                                              1,
                                                                          right:
                                                                              2,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          "lbl_gender".tr +
                                                                              ' ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.gioiTinh}',
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          textAlign:
                                                                              TextAlign.left,
                                                                          style: AppStyle
                                                                              .txtInterRegular16
                                                                              .copyWith(
                                                                            height:
                                                                                1.00,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                      left: 2,
                                                      top: 12,
                                                      right: 2,
                                                    ),
                                                    child: Text(
                                                      "lbl_nationality".tr +
                                                          ' ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.quocTich}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterRegular16
                                                          .copyWith(
                                                        height: 1.00,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                      left: 2,
                                                      top: 12,
                                                      right: 2,
                                                    ),
                                                    child: Text(
                                                      "lbl_address".tr +
                                                          ' ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.noiTru}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterRegular16
                                                          .copyWith(
                                                        height: 1.00,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: getPadding(
                                                      left: 2,
                                                      top: 12,
                                                      right: 2,
                                                      bottom: 17,
                                                    ),
                                                    child: Text(
                                                      "lbl_birth_place".tr +
                                                          ' ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.noiTru}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtInterRegular16
                                                          .copyWith(
                                                        height: 1.00,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding: getPadding(
                                                //left: 141,
                                                top: 34,
                                                //right: 141,
                                              ),
                                              child: Text(
                                                "lbl_results".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtInterRegular16
                                                    .copyWith(
                                                  height: 1.00,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: getPadding(
                                              top: 8,
                                              //bottom: 25,
                                            ),
                                            child: Obx(
                                              () => ListView.builder(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: trackingController
                                                    .frame34663ModelObj
                                                    .value
                                                    .listrectangle4481ItemList
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  ListrectangleItemModel model =
                                                      trackingController
                                                              .frame34663ModelObj
                                                              .value
                                                              .listrectangle4481ItemList[
                                                          index];
                                                  return ListrectangleItemWidget(
                                                    model,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: getVerticalSize(
                                                300.00,
                                              ),
                                              width: double.infinity,
                                              margin: getMargin(
                                                left: 2,
                                                right: 2,
                                              ),
                                              decoration: BoxDecoration(
                                                color: ColorConstant.indigo200,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  getHorizontalSize(
                                                    16.00,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: getPadding(
                                                left: 2,
                                                top: 28,
                                                right: 12,
                                                //bottom: 391,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    height: getVerticalSize(
                                                      19.00,
                                                    ),
                                                    width: getHorizontalSize(
                                                      17.00,
                                                    ),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                            height:
                                                                getVerticalSize(
                                                              19.00,
                                                            ),
                                                            width:
                                                                getHorizontalSize(
                                                              17.00,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorConstant
                                                                  .indigo80099,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                getHorizontalSize(
                                                                  19.00,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding: getPadding(
                                                              left: 1,
                                                              top: 1,
                                                              right: 1,
                                                              bottom: 1,
                                                            ),
                                                            child:
                                                                CommonImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgCooli,
                                                              height:
                                                                  getVerticalSize(
                                                                7.00,
                                                              ),
                                                              width:
                                                                  getHorizontalSize(
                                                                9.00,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: getVerticalSize(
                                                      19.00,
                                                    ),
                                                    width: getHorizontalSize(
                                                      17.00,
                                                    ),
                                                    margin: getMargin(
                                                      left: 17,
                                                    ),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                            height:
                                                                getVerticalSize(
                                                              19.00,
                                                            ),
                                                            width:
                                                                getHorizontalSize(
                                                              17.00,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorConstant
                                                                  .indigo80099,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                getHorizontalSize(
                                                                  19.00,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding: getPadding(
                                                                //left: 8,
                                                                //top: 9,
                                                                //right: 8,
                                                                //bottom: 9,
                                                                ),
                                                            child:
                                                                CommonImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgVolume,
                                                              height:
                                                                  getVerticalSize(
                                                                12.00,
                                                              ),
                                                              width:
                                                                  getHorizontalSize(
                                                                9.00,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: getVerticalSize(
                                                      19.00,
                                                    ),
                                                    width: getHorizontalSize(
                                                      17.00,
                                                    ),
                                                    margin: getMargin(
                                                      left: 17,
                                                    ),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                            height:
                                                                getVerticalSize(
                                                              19.00,
                                                            ),
                                                            width:
                                                                getHorizontalSize(
                                                              17.00,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorConstant
                                                                  .indigo80099,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                getHorizontalSize(
                                                                  19.00,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding: getPadding(
                                                                // left: 8,
                                                                // top: 9,
                                                                // right: 8,
                                                                // bottom: 9,
                                                                ),
                                                            child:
                                                                CommonImageView(
                                                              svgPath: ImageConstant
                                                                  .imgCooliconWhiteA700,
                                                              height:
                                                                  getVerticalSize(
                                                                12.00,
                                                              ),
                                                              width:
                                                                  getHorizontalSize(
                                                                9.00,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: getVerticalSize(
                                                      19.00,
                                                    ),
                                                    width: getHorizontalSize(
                                                      17.00,
                                                    ),
                                                    margin: getMargin(
                                                      left: 17,
                                                    ),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                            height:
                                                                getVerticalSize(
                                                              19.00,
                                                            ),
                                                            width:
                                                                getHorizontalSize(
                                                              17.00,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorConstant
                                                                  .indigo80099,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                getHorizontalSize(
                                                                  19.00,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding: getPadding(
                                                                // left: 10,
                                                                // top: 13,
                                                                // right: 8,
                                                                // bottom: 13,
                                                                ),
                                                            child:
                                                                CommonImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgCoolicon,
                                                              height:
                                                                  getVerticalSize(
                                                                5.00,
                                                              ),
                                                              width:
                                                                  getHorizontalSize(
                                                                6.00,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: getVerticalSize(
                                                      19.00,
                                                    ),
                                                    width: getHorizontalSize(
                                                      17.00,
                                                    ),
                                                    margin: getMargin(
                                                      left: 17,
                                                    ),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Container(
                                                            height:
                                                                getVerticalSize(
                                                              19.00,
                                                            ),
                                                            width:
                                                                getHorizontalSize(
                                                              17.00,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorConstant
                                                                  .indigo80099,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                getHorizontalSize(
                                                                  19.00,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Padding(
                                                            padding: getPadding(
                                                                //all: 9,
                                                                ),
                                                            child:
                                                                CommonImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgMaximize,
                                                              height:
                                                                  getVerticalSize(
                                                                12.00,
                                                              ),
                                                              width:
                                                                  getHorizontalSize(
                                                                9.00,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 47, left: 23, right: 23),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Padding(
                                padding: getPadding(top: 1),
                                child: CommonImageView(
                                  svgPath: ImageConstant.imgArrowleft,
                                  height: getVerticalSize(12.00),
                                  width: getHorizontalSize(16.00),
                                ))),
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Text("msg_truy_v_t_i_t".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterMedium20
                                  .copyWith(height: 1.00))),
                    ],
                  ),
                ),
                //child: Text('ahihi'),
              )),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidgets(
        androidBuilder: UiTrackingSuccessScreenMobile,
        iosBuilder: UiTrackingSuccessScreenMobile,
        macosBuilder: UiTrackingSuccessScreenPC,
        windowBuilder: UiTrackingSuccessScreenPC,
        linuxBuilder: UiTrackingSuccessScreenPC,
        webBuilder: UiTrackingSuccessScreenPC);
  }
}

class TrackingSuccessScreen extends GetWidget<TrackingSuccessController> {
  @override
  Widget build(BuildContext context) {
    return UiTrackingSuccessScreen();
  }
}
