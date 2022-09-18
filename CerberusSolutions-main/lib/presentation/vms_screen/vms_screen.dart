import 'dart:convert';

import 'package:cerberus_ai_system/presentation/tracking_feature/controller/location_controller.dart';
import 'package:cerberus_ai_system/presentation/tracking_feature/controller/tracking_controller.dart';
import 'package:cerberus_ai_system/presentation/vms_screen/controller/cctv_event_controller.dart';
import 'package:cerberus_ai_system/presentation/vms_screen/controller/vms_controller.dart';
import 'package:cerberus_ai_system/presentation/vms_screen/models/camerapreview_item_model.dart';
import 'package:cerberus_ai_system/presentation/vms_screen/models/events_item_model.dart';
import 'package:cerberus_ai_system/presentation/vms_screen/widgets/camerapreview_item_widget.dart';
import 'package:cerberus_ai_system/presentation/vms_screen/widgets/events_item_widgets.dart';
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
import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/widgets/custom_button.dart';
import 'package:cerberus_ai_system/widgets/custom_drop_down.dart';
import 'package:cerberus_ai_system/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
//import 'package:web_socket_channel';

class VmsScreen extends GetWidget<VmsController> {
  @override
  Widget build(BuildContext context) {
    return UiVmsScreen();
  }
}

class UiVmsScreen extends StatefulWidget {
  const UiVmsScreen({Key? key}) : super(key: key);

  @override
  State<UiVmsScreen> createState() => _UiVmsScreenState();
}

class _UiVmsScreenState extends State<UiVmsScreen> {
  final vmsController = Get.find<VmsController>();
  final cctv_event_controller = Get.put(CCTVEventController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //registerWebsocketEvent
    cctv_event_controller.getCCTVEventList();
  }

  Widget UiVmsScreenPC(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  final List<Map> myProducts =
      List.generate(100000, (index) => {"id": index, "name": "Product $index"})
          .toList();
  Widget _body(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 181, 196, 231),
      padding: const EdgeInsets.all(8.0),
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                  decoration:
                      AppDecoration.gradientWhiteA70033WhiteA70033.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder2,
                  ),
                  margin: getMargin(all: 1),
                  height: size.height,
                  width: size.width,
                  child: Center(
                    child: Text('VMS',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style:
                            AppStyle.txtInterMedium20.copyWith(height: 1.00)),
                  ))),
          Flexible(
            flex: 6,
            child: Container(
              decoration: AppDecoration.gradientWhiteA70033WhiteA70033.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder2,
              ),
              margin: getMargin(all: 1),
              height: size.height,
              width: size.width,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: AppDecoration.outlineIndigoA400,
                      padding: EdgeInsets.all(2),
                      margin: getMargin(all: 1),
                      height: size.height,
                      width: size.width,
                      child: Padding(
                        padding: getPadding(
                          left: 1,
                          top: 2,
                          right: 1,
                          bottom: 2,
                        ),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 400,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                          itemCount: vmsController.camerapreviewModelObj.value
                              .camerapreviewItemList.length,
                          itemBuilder: (context, index) {
                            CamerapreviewItemModel model = vmsController
                                .camerapreviewModelObj
                                .value
                                .camerapreviewItemList[index];
                            return FittedBox(
                              child: CamerapreviewItemWidget(
                                model,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    // child: Container(
                    //     decoration: AppDecoration.gradientWhiteA70033WhiteA70033
                    //         .copyWith(
                    //       borderRadius: BorderRadiusStyle.roundedBorder2,
                    //     ),
                    //     margin: getMargin(all: 1),
                    //     height: size.height,
                    //     width: size.width,
                    //     child: ListView.builder(
                    //       controller: ScrollController(),
                    //       itemCount: 6,
                    //       itemBuilder: (context, index) {
                    //         return Events();
                    //       },
                    //     )),
                    child: Container(
                      margin: getMargin(
                        left: 1,
                        top: 1,
                        right: 1,
                      ),
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(
                      //     getHorizontalSize(
                      //       10.00,
                      //     ),
                      //   ),
                      // ),
                      decoration: AppDecoration.outlineIndigoA40012,
                      height: size.height,
                      width: size.width,
                      child: Obx(
                        () => ListView.builder(
                          //physics: BouncingScrollPhysics(),
                          //shrinkWrap: true,
                          controller: ScrollController(),
                          itemCount: vmsController
                              .eventsModelObj.value.eventsItemList.length,
                          itemBuilder: (context, index) {
                            EventsItemModel model = vmsController
                                .eventsModelObj.value.eventsItemList[index];
                            return FittedBox(
                              child: EventsItemWidget(
                                model,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    // child: Container(
                    //   height: size.height,
                    //   child: Column(
                    //     mainAxisSize: MainAxisSize.min,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Container(
                    //         margin: getMargin(
                    //           left: 1,
                    //           top: 1,
                    //           right: 1,
                    //         ),
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(
                    //             getHorizontalSize(
                    //               10.00,
                    //             ),
                    //           ),
                    //         ),
                    //         child: Obx(
                    //           () => ListView.builder(
                    //             //physics: BouncingScrollPhysics(),
                    //             //shrinkWrap: true,
                    //             itemCount: vmsController
                    //                 .eventsModelObj.value.eventsItemList.length,
                    //             itemBuilder: (context, index) {
                    //               EventsItemModel model = vmsController
                    //                   .eventsModelObj
                    //                   .value
                    //                   .eventsItemList[index];
                    //               return EventsItemWidget(
                    //                 model,
                    //               );
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              margin: getMargin(all: 20),
              height: size.height,
              width: size.width,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      //color: Colors.blueGrey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: getPadding(
                              left: 1,
                              top: 1,
                              right: 1,
                            ),
                            child: Text(
                              "lbl_chon_camera".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterBold14.copyWith(
                                height: 1.00,
                              ),
                            ),
                          ),
                          CustomButton(
                            width: 100,
                            variant: ButtonVariant.OutlineIndigoA100,
                            text: "lbl_server_name".tr,
                            margin: getMargin(
                              left: 1,
                              top: 4,
                              right: 1,
                            ),
                          ),
                          CustomButton(
                            width: 100,
                            variant: ButtonVariant.OutlineIndigoA100,
                            text: "lbl_server_name".tr,
                            margin: getMargin(
                              left: 1,
                              top: 8,
                              right: 1,
                            ),
                          ),
                          CustomButton(
                            width: 50,
                            text: "lbl_them_camera".tr,
                            margin: getMargin(
                              left: 1,
                              top: 9,
                              right: 1,
                              //bottom: 20,
                            ),
                            variant: ButtonVariant.FillIndigoA400,
                            padding: ButtonPadding.PaddingAll8,
                            fontStyle: ButtonFontStyle.InterMedium16WhiteA700,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      //color: Colors.blueGrey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: getPadding(
                              left: 1,
                              right: 1,
                            ),
                            child: Text(
                              "lbl_chon_khu_vuc".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtInterBold14.copyWith(
                                height: 1.00,
                              ),
                            ),
                          ),
                          CustomDropDown(
                            width: 100,
                            variant: DropDownVariant.FillWhiteA700,
                            focusNode: FocusNode(),
                            icon: Container(
                              margin: getMargin(
                                left: 1,
                                right: 1,
                              ),
                              child: CommonImageView(
                                svgPath: ImageConstant.imgCoolicon,
                              ),
                            ),
                            hintText: "lbl_khu_vuc".tr,
                            margin: getMargin(
                              top: 4,
                            ),
                            items: vmsController
                                .selectAreaModelObj.value.dropdownItemList,
                            onChanged: (value) {
                              vmsController.onSelected(value);
                            },
                          ),
                          Padding(
                            padding: getPadding(
                              top: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomButton(
                                  width: 80,
                                  variant: ButtonVariant.OutlineIndigoA100,
                                  text: "lbl_kv1".tr,
                                ),
                                CustomIconButton(
                                  height: getVerticalSize(25.00),
                                  width: getHorizontalSize(15.00),
                                  child: CommonImageView(
                                    width: 50,
                                    height: 50,
                                    svgPath: ImageConstant.imgLocation,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 9,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                // CustomButton(
                                //   width: 50,
                                //   text: "lbl_them_khu_vuc".tr,
                                //   variant:
                                //       ButtonVariant.OutlineIndigoA400,
                                //   padding: ButtonPadding.PaddingAll8,
                                //   fontStyle:
                                //       ButtonFontStyle.InterMedium16,
                                // ),
                                CustomButton(
                                  width: 50,
                                  text: "lbl_them_khu_vuc".tr,
                                  //variant: ButtonVariant.FillIndigoA400,
                                  variant: ButtonVariant.FillIndigoA400,
                                  padding: ButtonPadding.PaddingAll8,
                                  fontStyle:
                                      ButtonFontStyle.InterMedium16WhiteA700,
                                ),
                                CustomButton(
                                  width: 50,
                                  text: "lbl_xoa_khu_vuc".tr,
                                  variant: ButtonVariant.OutlineIndigoA100,
                                  //variant: ButtonVariant.FillIndigoA400,
                                  padding: ButtonPadding.PaddingAll8,
                                  // fontStyle:
                                  //     ButtonFontStyle.InterMedium16WhiteA700,
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
              // child: Container(
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Flexible(
              //         flex: 1,
              //         child: Container(
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               CustomTextEditController(
              //                 width: 200,
              //                 focusNode: FocusNode(),
              //                 controller: TextEditingController(),
              //                 hintText: 'Lựa chọn vị trí Camera',
              //                 margin: getMargin(
              //                   left: 2,
              //                   top: 5,
              //                   right: 2,
              //                 ),
              //                 padding: EdgeInsets.all(2),
              //                 //alignment: Alignment.center,
              //               ),
              //               CustomTextEditController(
              //                 width: 200,
              //                 focusNode: FocusNode(),
              //                 controller: TextEditingController(),
              //                 hintText: 'Link RTSP',
              //                 margin: getMargin(
              //                   left: 2,
              //                   top: 5,
              //                   right: 2,
              //                 ),
              //                 padding: EdgeInsets.all(2),
              //                 //alignment: Alignment.center,
              //               ),
              //               TextButton(
              //                 child: Text("Thêm Camera"),
              //                 onPressed: () {
              //                   print('init');
              //                   print('end');
              //                 },
              //                 style: ButtonStyle(
              //                   backgroundColor:
              //                       MaterialStateProperty.all<Color>(
              //                           Colors.greenAccent),
              //                   foregroundColor:
              //                       MaterialStateProperty.all<Color>(
              //                           Colors.black),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Flexible(
              //         flex: 1,
              //         child: Container(
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               CustomDropDown(
              //                   width: 200,
              //                   focusNode: FocusNode(),
              //                   icon: Container(
              //                       child: CommonImageView(
              //                           svgPath: ImageConstant.imgArrowdown)),
              //                   hintText: 'Lựa chọn vị trí Camera',
              //                   margin: getMargin(left: 2, top: 5),
              //                   fontStyle: DropDownFontStyle.InterRegular18,
              //                   items: vmsController
              //                       .vmsModles.value.dropdownCameraList,
              //                   onChanged: (value) {
              //                     vmsController.onSelected(value);
              //                   }),
              //               Container(
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   children: [
              //                     CustomTextEditController(
              //                       width: 60,
              //                       focusNode: FocusNode(),
              //                       controller: TextEditingController(),
              //                       hintText: 'Thêm khu vực ở đây',
              //                       margin: getMargin(
              //                         left: 2,
              //                         top: 5,
              //                         right: 2,
              //                       ),
              //                       padding: EdgeInsets.all(2),
              //                       alignment: Alignment.center,
              //                     ),
              //                     Icon(
              //                       Icons.maps_ugc_outlined,
              //                     )
              //                   ],
              //                 ),
              //               ),
              //               Container(
              //                 padding: EdgeInsets.only(left: 8, right: 8),
              //                 child: Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Expanded(
              //                       child: Container(
              //                         margin: getMargin(all: 1),
              //                         child: TextButton(
              //                           child: Text("Thêm khu vực"),
              //                           onPressed: () {},
              //                           style: ButtonStyle(
              //                             backgroundColor:
              //                                 MaterialStateProperty.all<
              //                                     Color>(Colors.greenAccent),
              //                             foregroundColor:
              //                                 MaterialStateProperty.all<
              //                                     Color>(Colors.black),
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                     Expanded(
              //                       child: Container(
              //                         margin: getMargin(all: 1),
              //                         child: TextButton(
              //                           child: Text("Xoá khu vực"),
              //                           onPressed: () {},
              //                           style: ButtonStyle(
              //                             backgroundColor:
              //                                 MaterialStateProperty.all<
              //                                     Color>(Colors.greenAccent),
              //                             foregroundColor:
              //                                 MaterialStateProperty.all<
              //                                     Color>(Colors.black),
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //       Flexible(
              //           flex: 2,
              //           child: Container(
              //             width: size.width,
              //           ))
              //     ],
              //   ),
              // ),
            ),
          )
        ],
      ),
    );
  }

  Widget UiVmsScreenMobile(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ahihi'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidgets(
        androidBuilder: UiVmsScreenMobile,
        iosBuilder: UiVmsScreenMobile,
        macosBuilder: UiVmsScreenPC,
        windowBuilder: UiVmsScreenPC,
        linuxBuilder: UiVmsScreenPC,
        webBuilder: UiVmsScreenPC);
  }
}

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: getMargin(all: 2),
      height: 200,
      width: size.width,
      child: Row(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                width: size.width,
                height: size.height,
                decoration: AppDecoration.fillGray50.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder2,
                ),
                child: Center(
                  child: Text('Hiển thị ảnh Event'),
                ),
              )),
          Flexible(
              flex: 3,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('ID:'), Text('Name:'), Text('Time:')],
                ),
              ))
        ],
      ),
    );
  }
}

class CustomStreamRTSP extends StatelessWidget {
  const CustomStreamRTSP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(onPressed: (() {}), child: Icon(Icons.add)),
                  TextButton(onPressed: (() {}), child: Icon(Icons.delete))
                ],
              )),
          Flexible(
              flex: 5,
              child: Container(
                margin: getMargin(all: 2),
                color: Colors.grey,
                width: size.width,
                height: size.height,
                child: Center(
                  child: Text('Camera Preview'),
                ),
              ))
        ],
      ),
    );
  }
}
