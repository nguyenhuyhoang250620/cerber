import 'package:cerberus_ai_system/presentation/tracking_feature/controller/location_controller.dart';
import 'package:cerberus_ai_system/presentation/tracking_feature/controller/tracking_controller.dart';
import 'package:cerberus_ai_system/widgets/custom_admin_scaffold.dart';
import 'package:cerberus_ai_system/widgets/custom_texteditcontroller_view.dart';
import 'package:cerberus_ai_system/widgets/platformwidgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'dart:io';
import '../tracking_feature/widgets/listfront_item_widget.dart';
import '../tracking_feature/widgets/liststarttime_item_widget.dart';
import 'controller/tracking_controller.dart';
import 'models/listfront_item_model.dart';
import 'models/liststarttime_item_model.dart';
import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/widgets/custom_button.dart';
import 'package:cerberus_ai_system/widgets/custom_drop_down.dart';
import 'package:cerberus_ai_system/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TrackingScreen extends GetWidget<TrackingController> {
  @override
  Widget build(BuildContext context) {
    return UiTrackingScreen();
  }
}

class UiTrackingScreen extends StatefulWidget {
  const UiTrackingScreen({Key? key}) : super(key: key);

  @override
  State<UiTrackingScreen> createState() => _UiTrackingScreenState();
}

class _UiTrackingScreenState extends State<UiTrackingScreen> {
  String dropDownValue = 'Khu Vực';
  var items = ['Khu Vực', 'B', 'C'];
  PageController page = PageController();
  final trackingController = Get.find<TrackingController>();
  final locationController = Get.put(LocationController());
  TextEditingController controllerText = TextEditingController();
  //pick image
  String? _fileName;
  String? _saveAsFileName;
  List<PlatformFile>? _paths;
  List<PlatformFile>? _pathFrontImage;
  List<PlatformFile>? _pathBackImage;
  String? _directoryPath;
  String? _extension;
  bool _isLoading = false;
  bool _userAborted = false;
  bool _loadImage = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locationController.getVMSLocationDataList();
    locationController.getVMSLocationDataById(5);
  }

  void _pickFiles(int id) async {
    _resetState();
    try {
      _directoryPath = null;
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        onFileLoading: (FilePickerStatus status) => print(status),
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      e.toString();
    } catch (e) {
      e.toString();
    }
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _fileName =
          _paths != null ? _paths!.map((e) => e.name).toString() : '...';
      _userAborted = _paths == null;
      if (id == 0) {
        _pathFrontImage = _paths;
      } else {
        _pathBackImage = _paths;
      }
    });
  }

  void _resetState() {
    if (!mounted) {
      return;
    }
    setState(() {
      _isLoading = true;
      _directoryPath = null;
      _fileName = null;
      _paths = null;
      _saveAsFileName = null;
      _userAborted = false;
    });
  }

  void onTapKiemtra() {
    _pathFrontImage != null && _pathBackImage != null
        ? {
            trackingController.getTrackingData(
                frontPath:
                    _pathFrontImage!.map((e) => e.path).toList()[0].toString(),
                backPath:
                    _pathBackImage!.map((e) => e.path).toList()[0].toString()),
            Get.back,
            Get.toNamed(AppRoutes.trackingSuccessScreen),
          }
        : setState(() {
            _loadImage = true;
          });
    Get.back;
    Get.toNamed(AppRoutes.trackingSuccessScreen);
  }

  Widget UiInputImage(BuildContext context) {
    //print(trackingController.trackingModel1);
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorConstant.blue100,
                    borderRadius:
                        BorderRadius.circular(getHorizontalSize(16.00))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  child: Center(
                    child: InkWell(
                      onTap: (() => _pickFiles(0)),
                      child: Builder(
                        builder: (BuildContext context) => _isLoading
                            ? const Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: CircularProgressIndicator(),
                              )
                            : _pathFrontImage != null
                                ? Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 30.0),
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: Image.file(
                                      File(_pathFrontImage!
                                          .map((e) => e.path)
                                          .toList()[0]
                                          .toString()),
                                      fit: BoxFit.fill,
                                    ))
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.add_a_photo),
                                      Text(
                                        'Ảnh mặt trước',
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                      ),
                    ),
                  ),
                ),
              ),
            )),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorConstant.blue100,
                    borderRadius:
                        BorderRadius.circular(getHorizontalSize(16.00))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  child: Center(
                    child: InkWell(
                      onTap: (() => _pickFiles(1)),
                      child: Builder(
                        builder: (BuildContext context) => _isLoading
                            ? const Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: CircularProgressIndicator(),
                              )
                            : _pathBackImage != null
                                ? Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 30.0),
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: Image.file(
                                      File(_pathBackImage!
                                          .map((e) => e.path)
                                          .toList()[0]
                                          .toString()),
                                      fit: BoxFit.fill,
                                    ))
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.add_a_photo),
                                      Text(
                                        'Ảnh mặt sau',
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                      ),
                    ),
                  ),
                ),
              ),
            )),
      ],
    );
  }

  Widget UiTrackingScreenMobile(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
            width: double.infinity,
            //width: size.width,
            child: Container(
                height: size.height,
                width: size.width,
                child: Stack(alignment: Alignment.topCenter, children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          //width: size.width,
                          decoration: AppDecoration.fillWhiteA700,
                          child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: CommonImageView(
                                        imagePath:
                                            ImageConstant.imgMesadetrabajo,
                                        height: getVerticalSize(900.00),
                                        width: getHorizontalSize(400.00))),
                                Column(
                                  children: [
                                    Expanded(flex: 1, child: SizedBox()),
                                    Expanded(
                                      flex: 9,
                                      child: SingleChildScrollView(
                                        child: Container(
                                            decoration: AppDecoration
                                                .gradientWhiteA70033WhiteA70033,
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                          width:
                                                              double.infinity,
                                                          margin: getMargin(
                                                            left: 11,
                                                            top: 11,
                                                            right: 11,
                                                          ),
                                                          decoration: AppDecoration
                                                              .fillWhiteA7007f
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .roundedBorder16),
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                    padding: getPadding(
                                                                        left: 2,
                                                                        top: 20,
                                                                        right:
                                                                            2,
                                                                        bottom:
                                                                            20),
                                                                    child: Text(
                                                                        "lbl_enter_infor"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtInterRegular28
                                                                            .copyWith(height: 1.00))),
                                                                Padding(
                                                                    padding: getPadding(
                                                                        left: 2,
                                                                        top: 4,
                                                                        right:
                                                                            2),
                                                                    child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .center,
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                              padding: getPadding(top: 2),
                                                                              child: Text("msg_enter_id_number".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtInterRegular14.copyWith(height: 1.00))),
                                                                          CustomTextEditController(
                                                                            width:
                                                                                100,
                                                                            focusNode:
                                                                                FocusNode(),
                                                                            controller:
                                                                                trackingController.inputTextController,
                                                                            hintText:
                                                                                "lbl_id_number".tr,
                                                                            margin:
                                                                                getMargin(
                                                                              //left: 2,
                                                                              top: 5,
                                                                              right: 2,
                                                                            ),
                                                                            padding:
                                                                                EdgeInsets.all(0),
                                                                            //alignment: Alignment.center,
                                                                          ),
                                                                        ])),
                                                                Obx(() => ListView
                                                                    .builder(
                                                                        shrinkWrap:
                                                                            true,
                                                                        padding: getPadding(
                                                                            left:
                                                                                2,
                                                                            right:
                                                                                2,
                                                                            bottom:
                                                                                20),
                                                                        physics:
                                                                            BouncingScrollPhysics(),
                                                                        itemCount: trackingController
                                                                            .truyVetModelObj
                                                                            .value
                                                                            .listfrontItemList
                                                                            .length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          ListfrontItemModel model = trackingController
                                                                              .truyVetModelObj
                                                                              .value
                                                                              .listfrontItemList[index];
                                                                          model.setId(
                                                                              index);
                                                                          //print(index);
                                                                          return ListfrontItemWidget(
                                                                            model,
                                                                            () {
                                                                              _pickFiles(index);
                                                                            },
                                                                          );
                                                                        })),
                                                              ]))),
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                          width:
                                                              double.infinity,
                                                          margin: getMargin(
                                                              left: 11,
                                                              top: 13,
                                                              right: 11),
                                                          decoration: AppDecoration
                                                              .fillWhiteA7007f
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .roundedBorder16),
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Padding(
                                                                    padding: getPadding(
                                                                        left: 2,
                                                                        top: 20,
                                                                        right:
                                                                            2),
                                                                    child: Text(
                                                                        "lbl_tracking_area"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtInterRegular28
                                                                            .copyWith(height: 1.00))),
                                                                Container(
                                                                  // decoration:
                                                                  //     AppDecoration.outlineBlack9003f.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                        child: Padding(
                                                                            padding: getPadding(left: 2, top: 20, right: 2),
                                                                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
                                                                              Padding(padding: getPadding(top: 0, bottom: 0), child: Text("lbl_server".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtInterRegular14.copyWith(height: 1.00))),
                                                                              CustomDropDown(
                                                                                  width: 70,
                                                                                  focusNode: FocusNode(),
                                                                                  icon: Container(child: CommonImageView(svgPath: ImageConstant.imgArrowdown)),
                                                                                  hintText: "lbl_choose_server".tr,
                                                                                  margin: getMargin(left: 2),
                                                                                  items: trackingController.truyVetModelObj.value.dropdownItemList,
                                                                                  onChanged: (value) {
                                                                                    trackingController.onSelected(value);
                                                                                  }),
                                                                            ])),
                                                                      ),
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              left:
                                                                                  2,
                                                                              top:
                                                                                  20,
                                                                              right:
                                                                                  2),
                                                                          child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(padding: getPadding(top: 0, bottom: 0), child: Text("lbl_tracking_area2".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtInterRegular14.copyWith(height: 1.00))),
                                                                                CustomDropDown(
                                                                                    width: 70,
                                                                                    focusNode: FocusNode(),
                                                                                    icon: Container(child: CommonImageView(svgPath: ImageConstant.imgArrowdown)),
                                                                                    hintText: "lbl_choose_server".tr,
                                                                                    margin: getMargin(left: 2),
                                                                                    items: trackingController.truyVetModelObj.value.dropdownItemList1,
                                                                                    onChanged: (value) {
                                                                                      trackingController.onSelected1(value);
                                                                                    }),
                                                                              ])),
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              left:
                                                                                  2,
                                                                              top:
                                                                                  20,
                                                                              right:
                                                                                  2),
                                                                          child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                    padding: getPadding(
                                                                                      top: 0,
                                                                                    ),
                                                                                    child: Text("lbl_choose_camera".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtInterRegular14.copyWith(height: 1.00))),
                                                                                CustomDropDown(
                                                                                    width: 70,
                                                                                    focusNode: FocusNode(),
                                                                                    icon: Container(margin: getMargin(left: 2, right: 2), child: CommonImageView(svgPath: ImageConstant.imgArrowdown)),
                                                                                    hintText: "lbl_choose_server".tr,
                                                                                    margin: getMargin(left: 2),
                                                                                    items: trackingController.truyVetModelObj.value.dropdownItemList2,
                                                                                    onChanged: (value) {
                                                                                      trackingController.onSelected2(value);
                                                                                    }),
                                                                              ])),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    child:
                                                                        Flexible(
                                                                      child: Padding(
                                                                          padding: getPadding(left: 2, top: 20, right: 2),
                                                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
                                                                            Flexible(child: CustomButton(width: 100, text: "lbl_camera_1".tr)),
                                                                            Flexible(child: CustomIconButton(height: 24, width: 24, margin: getMargin(left: 7, bottom: 1), variant: IconButtonVariant.OutlineIndigo9001_2, child: CommonImageView(svgPath: ImageConstant.imgTrash)))
                                                                          ])),
                                                                    )),
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    child:
                                                                        Flexible(
                                                                      child: Padding(
                                                                          padding: getPadding(left: 2, top: 20, right: 2, bottom: 20),
                                                                          child: Row(
                                                                              //mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Flexible(child: CustomButton(width: 100, text: "lbl_camera_1".tr)),
                                                                                Flexible(child: CustomIconButton(height: 24, width: 24, margin: getMargin(left: 7, bottom: 1), variant: IconButtonVariant.OutlineIndigo9001_2, child: CommonImageView(svgPath: ImageConstant.imgTrash)))
                                                                              ])),
                                                                    ))
                                                              ]))),
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                          width:
                                                              double.infinity,
                                                          margin: getMargin(
                                                              left: 11,
                                                              top: 13,
                                                              right: 11),
                                                          decoration: AppDecoration
                                                              .fillWhiteA7007f
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .roundedBorder16),
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                    padding:
                                                                        getPadding(
                                                                            // left:
                                                                            //     29,
                                                                            // top: 5,
                                                                            // right:
                                                                            //     29
                                                                            ),
                                                                    child: Text(
                                                                        "lbl_tracking_time"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtInterRegular28
                                                                            .copyWith(height: 1.00))),
                                                                Padding(
                                                                    padding: getPadding(
                                                                        left:
                                                                            29,
                                                                        top: 5,
                                                                        right:
                                                                            29,
                                                                        bottom:
                                                                            5),
                                                                    child: Obx(() => ListView.builder(
                                                                        padding: EdgeInsets.all(0),
                                                                        physics: BouncingScrollPhysics(),
                                                                        shrinkWrap: true,
                                                                        itemCount: trackingController.truyVetModelObj.value.liststarttimeItemList.length,
                                                                        itemBuilder: (context, index) {
                                                                          ListstarttimeItemModel model = trackingController
                                                                              .truyVetModelObj
                                                                              .value
                                                                              .liststarttimeItemList[index];
                                                                          return ListstarttimeItemWidget(
                                                                              model);
                                                                        })))
                                                              ]))),
                                                  CustomButton(
                                                    width: 184,
                                                    text: "lbl_start".tr,
                                                    margin: getMargin(
                                                        left: 87,
                                                        top: 13,
                                                        right: 87,
                                                        bottom: 23),
                                                    variant: ButtonVariant
                                                        .FillLightblueA700,
                                                    shape: ButtonShape
                                                        .RoundedBorder8,
                                                    padding: ButtonPadding
                                                        .PaddingAll12,
                                                    fontStyle: ButtonFontStyle
                                                        .InterRegular16,
                                                    alignment:
                                                        Alignment.centerRight,
                                                    onTap: onTapKiemtra,
                                                  )
                                                ])),
                                      ),
                                    ),
                                  ],
                                )
                              ]))),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          margin: getMargin(right: 1, bottom: 10, top: 10),
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                  padding:
                                      getPadding(left: 23, top: 37, right: 23),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Padding(
                                                padding: getPadding(top: 1),
                                                child: CommonImageView(
                                                    svgPath: ImageConstant
                                                        .imgArrowleft,
                                                    height:
                                                        getVerticalSize(12.00),
                                                    width: getHorizontalSize(
                                                        16.00)))),
                                        Padding(
                                            padding: getPadding(left: 69),
                                            child: Text("msg_truy_v_t_i_t".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtInterMedium20
                                                    .copyWith(height: 1.00)))
                                      ])))))
                ]))));
  }

  Widget UiTrackingScreenPC(BuildContext context) {
    return CustomAdminScaffold(
      // backgroundColor: Colors.transparent,
      pathImageBackground: 'assets/images/landingbackground.png',
      route: AppRoutes.trackingScreen,
      body: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Container(
              height: size.height,
              width: size.width,
              child: Column(
                children: [
                  Flexible(
                      flex: 1,
                      child: Center(
                        child: Text("msg_truy_v_t_i_t".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterMedium20
                                .copyWith(height: 1.00)),
                      )),
                  Flexible(
                    flex: 9,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Container(
                            decoration:
                                AppDecoration.gradientWhiteA70033WhiteA70033,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ResponsiveRowColumn(
                                    rowMainAxisAlignment:
                                        MainAxisAlignment.center,
                                    rowCrossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    layout: ResponsiveWrapper.of(context)
                                            .isSmallerThan(DESKTOP)
                                        ? ResponsiveRowColumnType.COLUMN
                                        : ResponsiveRowColumnType.ROW,
                                    children: [
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
                                                  ? 65.h
                                                  : 65.h,
                                              margin: getMargin(
                                                  left: 1,
                                                  top: 20,
                                                  right: 1,
                                                  bottom: 20),
                                              decoration: AppDecoration
                                                  .fillWhiteA7007f
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder16),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                        padding: getPadding(
                                                            left: 2,
                                                            top: 20,
                                                            right: 2,
                                                            bottom: 20),
                                                        child: Text(
                                                            "lbl_enter_infor"
                                                                .tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtInterRegular28
                                                                .copyWith(
                                                                    height:
                                                                        1.00))),
                                                    Padding(
                                                        padding: getPadding(
                                                            left: 2,
                                                            top: 4,
                                                            right: 2),
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Flexible(
                                                                child: Padding(
                                                                    padding:
                                                                        getPadding(
                                                                            top:
                                                                                2),
                                                                    child: Text(
                                                                        "msg_enter_id_number"
                                                                            .tr,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left,
                                                                        style: AppStyle
                                                                            .txtInterRegular20
                                                                            .copyWith(height: 1.00))),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    CustomTextEditController(
                                                                  width: 84,
                                                                  focusNode:
                                                                      FocusNode(),
                                                                  controller:
                                                                      trackingController
                                                                          .inputTextController,
                                                                  hintText:
                                                                      "lbl_id_number"
                                                                          .tr,
                                                                  margin:
                                                                      getMargin(
                                                                    left: 2,
                                                                    top: 5,
                                                                    right: 2,
                                                                  ),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              2),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                ),
                                                              )
                                                            ])),
                                                    Obx(() => ListView.builder(
                                                        shrinkWrap: true,
                                                        padding: getPadding(
                                                            left: 2,
                                                            right: 2,
                                                            bottom: 20),
                                                        physics:
                                                            BouncingScrollPhysics(),
                                                        itemCount:
                                                            trackingController
                                                                .truyVetModelObj
                                                                .value
                                                                .listfrontItemList
                                                                .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          ListfrontItemModel
                                                              model =
                                                              trackingController
                                                                  .truyVetModelObj
                                                                  .value
                                                                  .listfrontItemList[index];
                                                          model.setId(index);
                                                          //print(index);
                                                          return ListfrontItemWidget(
                                                            model,
                                                            () {
                                                              _pickFiles(index);
                                                            },
                                                          );
                                                        })),
                                                  ])),
                                        ),
                                      ),
                                      ResponsiveRowColumnItem(
                                        rowFlex: 2,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Container(
                                            width: ResponsiveWrapper.of(context)
                                                    .isSmallerThan(DESKTOP)
                                                ? 100.w
                                                : 40.w,
                                            height:
                                                ResponsiveWrapper.of(context)
                                                        .isSmallerThan(DESKTOP)
                                                    ? null
                                                    : 65.h,
                                            margin: getMargin(
                                                //left: 10,
                                                top: 20,
                                                right: 1,
                                                bottom: 20),
                                            // decoration: AppDecoration
                                            //     .fillWhiteA7007f
                                            //     .copyWith(
                                            //         borderRadius:
                                            //             BorderRadiusStyle
                                            //                 .roundedBorder16),
                                            // child: Text(
                                            //   'ahihi',
                                            //   style: TextStyle(fontSize: 100),
                                            // ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                    margin: getMargin(
                                                        left: 0, right: 0),
                                                    decoration: AppDecoration
                                                        .fillWhiteA7007f
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder16),
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 2,
                                                                      top: 20,
                                                                      right: 2),
                                                              child: Text(
                                                                  "lbl_tracking_area"
                                                                      .tr,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtInterRegular28
                                                                      .copyWith(
                                                                          height:
                                                                              1.00))),
                                                          Container(
                                                            // decoration:
                                                            //     AppDecoration.outlineBlack9003f.copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  child:
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              left:
                                                                                  2,
                                                                              top:
                                                                                  20,
                                                                              right:
                                                                                  2),
                                                                          child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: <Widget>[
                                                                                Padding(padding: getPadding(top: 0, bottom: 0), child: Text("lbl_server".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtInterRegular20.copyWith(height: 1.00))),
                                                                                CustomDropDown(
                                                                                    width: 70,
                                                                                    focusNode: FocusNode(),
                                                                                    icon: Container(child: CommonImageView(svgPath: ImageConstant.imgArrowdown)),
                                                                                    hintText: "lbl_choose_server".tr,
                                                                                    margin: getMargin(left: 2),
                                                                                    fontStyle: DropDownFontStyle.InterRegular18,
                                                                                    items: trackingController.truyVetModelObj.value.dropdownItemList,
                                                                                    onChanged: (value) {
                                                                                      trackingController.onSelected(value);
                                                                                    }),
                                                                              ])),
                                                                ),
                                                                Padding(
                                                                    padding: getPadding(
                                                                        left: 2,
                                                                        top: 20,
                                                                        right:
                                                                            2),
                                                                    child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .center,
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                              padding: getPadding(top: 0, bottom: 0),
                                                                              child: Text("lbl_tracking_area2".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtInterRegular20.copyWith(height: 1.00))),
                                                                          CustomDropDown(
                                                                              width: 70,
                                                                              focusNode: FocusNode(),
                                                                              icon: Container(child: CommonImageView(svgPath: ImageConstant.imgArrowdown)),
                                                                              hintText: "lbl_choose_server".tr,
                                                                              margin: getMargin(left: 2),
                                                                              fontStyle: DropDownFontStyle.InterRegular18,
                                                                              items: trackingController.truyVetModelObj.value.dropdownItemList1,
                                                                              onChanged: (value) {
                                                                                trackingController.onSelected1(value);
                                                                              }),
                                                                        ])),
                                                                Padding(
                                                                    padding: getPadding(
                                                                        left: 2,
                                                                        top: 20,
                                                                        right:
                                                                            2),
                                                                    child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .center,
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                              padding: getPadding(
                                                                                top: 0,
                                                                              ),
                                                                              child: Text("lbl_choose_camera".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtInterRegular20.copyWith(height: 1.00))),
                                                                          CustomDropDown(
                                                                              width: 70,
                                                                              focusNode: FocusNode(),
                                                                              icon: Container(margin: getMargin(left: 2, right: 2), child: CommonImageView(svgPath: ImageConstant.imgArrowdown)),
                                                                              hintText: "lbl_choose_server".tr,
                                                                              margin: getMargin(left: 2),
                                                                              fontStyle: DropDownFontStyle.InterRegular18,
                                                                              items: trackingController.truyVetModelObj.value.dropdownItemList2,
                                                                              onChanged: (value) {
                                                                                trackingController.onSelected2(value);
                                                                              }),
                                                                        ])),
                                                              ],
                                                            ),
                                                          ),
                                                          Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Flexible(
                                                                child: Padding(
                                                                    padding: getPadding(
                                                                        left: 2,
                                                                        top: 20,
                                                                        right:
                                                                            2),
                                                                    child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .center,
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Flexible(
                                                                              child: CustomButton(width: 100, text: "lbl_camera_1".tr)),
                                                                          Flexible(
                                                                              child: CustomIconButton(height: 24, width: 24, margin: getMargin(left: 7, bottom: 1), variant: IconButtonVariant.OutlineIndigo9001_2, child: CommonImageView(svgPath: ImageConstant.imgTrash)))
                                                                        ])),
                                                              )),
                                                          Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Flexible(
                                                                child: Padding(
                                                                    padding: getPadding(
                                                                        left: 2,
                                                                        top: 20,
                                                                        right:
                                                                            2,
                                                                        bottom:
                                                                            20),
                                                                    child: Row(
                                                                        //mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min,
                                                                        children: [
                                                                          Flexible(
                                                                              child: CustomButton(width: 100, text: "lbl_camera_1".tr)),
                                                                          Flexible(
                                                                              child: CustomIconButton(height: 24, width: 24, margin: getMargin(left: 7, bottom: 1), variant: IconButtonVariant.OutlineIndigo9001_2, child: CommonImageView(svgPath: ImageConstant.imgTrash)))
                                                                        ])),
                                                              ))
                                                        ])),
                                                Container(
                                                    // width:
                                                    //     MediaQuery.of(context)
                                                    //         .size
                                                    //         .width,

                                                    margin: getMargin(
                                                        left: 0,
                                                        top: 13,
                                                        right: 0),
                                                    decoration: AppDecoration
                                                        .fillWhiteA7007f
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder16),
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding: getPadding(
                                                                left: 2,
                                                                top: 20,
                                                                right: 2),
                                                            child: Text(
                                                                "lbl_tracking_time"
                                                                    .tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtInterRegular28
                                                                    .copyWith(
                                                                        height:
                                                                            1.00)),
                                                          ),
                                                          Padding(
                                                            padding: getPadding(
                                                                left: 2,
                                                                top: 11,
                                                                right: 2,
                                                                bottom: 19),
                                                            //padding: getPadding(left: 0, top: 0, right: 0, bottom: 0),
                                                            child: ListstarttimeItemWidget(
                                                                trackingController
                                                                    .truyVetModelObj
                                                                    .value
                                                                    .liststarttimeItemList[0]),
                                                            //Obx(() => ListView.builder(
                                                            //     //physics: BouncingScrollPhysics(),
                                                            //     //shrinkWrap: true,
                                                            //     itemCount: controller.truyVetModelObj.value.liststarttimeItemList.length,
                                                            //     itemBuilder: (context, index) {
                                                            //       ListstarttimeItemModel model = controller.truyVetModelObj.value.liststarttimeItemList[index];
                                                            //       return ListstarttimeItemWidget(model);
                                                            //       //return Text('ahihi');
                                                            //     }))
                                                          ),
                                                          Padding(
                                                            padding: getPadding(
                                                                left: 2,
                                                                top: 11,
                                                                right: 2,
                                                                bottom: 19),
                                                            //padding: getPadding(left: 0, top: 0, right: 0, bottom: 0),
                                                            child: ListstarttimeItemWidget(
                                                                trackingController
                                                                    .truyVetModelObj
                                                                    .value
                                                                    .liststarttimeItemList[1]),
                                                          )
                                                        ])),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 13, bottom: 5),
                                    child: CustomButton(
                                      width: 184,
                                      text: "lbl_start".tr,
                                      // margin: getMargin(
                                      //     top: 13, bottom: 23),
                                      variant: ButtonVariant.FillLightblueA700,
                                      shape: ButtonShape.RoundedBorder8,
                                      padding: ButtonPadding.PaddingAll12,
                                      fontStyle: ButtonFontStyle.InterRegular16,
                                      alignment: Alignment.center,
                                      onTap: () {
                                        onTapKiemtra();
                                      },
                                    ),
                                  )
                                  //Text('data')
                                ])),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidgets(
        androidBuilder: UiTrackingScreenMobile,
        iosBuilder: UiTrackingScreenMobile,
        macosBuilder: UiTrackingScreenPC,
        windowBuilder: UiTrackingScreenPC,
        linuxBuilder: UiTrackingScreenPC,
        webBuilder: UiTrackingScreenPC);
  }
}
