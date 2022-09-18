import 'dart:io';

import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/presentation/tracking_feature/controller/location_controller.dart';
import 'package:cerberus_ai_system/widgets/common_home_scaffold.dart';
import 'package:cerberus_ai_system/widgets/custom_admin_scaffold.dart';
import 'package:cerberus_ai_system/widgets/custom_button.dart';
import 'package:cerberus_ai_system/widgets/platformwidgets.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../presentation/tracking_feature/controller/tracking_controller.dart';

class CustomTracking extends StatefulWidget {
  const CustomTracking({Key? key}) : super(key: key);

  //final String title;

  @override
  _CustomTrackingState createState() => _CustomTrackingState();
}

class _CustomTrackingState extends State<CustomTracking> {
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
        allowedExtensions: (_extension?.isNotEmpty ?? false) ? _extension?.replaceAll(' ', '').split(',') : null,
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
      _fileName = _paths != null ? _paths!.map((e) => e.name).toString() : '...';
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
  // Pick image

  Widget UiTruyvet(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 1, child: Container()),
        Expanded(
          flex: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorConstant.gray200,
                      ).copyWith(),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 100, right: 100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorConstant.gray200,
                                  ).copyWith(),
                                  child: const Center(child: Text('Nhập thông tin đối tượng')),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                                flex: 1,
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: ColorConstant.gray200,
                                    ).copyWith(),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Center(
                                              child: Text('Thêm ảnh CMND/CCCD của đối tượng hoặc nhập ID định danh'),
                                            )),
                                        Expanded(
                                            //padding: EdgeInsets.all(10),
                                            child: Center(
                                          child: TextField(
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: '',
                                              hintText: 'Nhap ID',
                                            ),
                                          ),
                                        ))
                                      ],
                                    ))),
                            const SizedBox(
                              height: 30,
                            ),
                            Expanded(
                                flex: 8,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorConstant.gray200,
                                  ).copyWith(),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: ColorConstant.gray200,
                                              ).copyWith(),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                      flex: 7,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: ColorConstant.gray9007a,
                                                        ).copyWith(),
                                                        child: Builder(
                                                            builder: (BuildContext context) => _isLoading
                                                                ? const Padding(
                                                                    padding: EdgeInsets.only(bottom: 10.0),
                                                                    child: CircularProgressIndicator(),
                                                                  )
                                                                : _pathFrontImage != null
                                                                    ? Container(
                                                                        padding: const EdgeInsets.only(bottom: 30.0),
                                                                        height:
                                                                            MediaQuery.of(context).size.height * 0.2,
                                                                        child: Image.file(
                                                                          File(_pathFrontImage!
                                                                              .map((e) => e.path)
                                                                              .toList()[0]
                                                                              .toString()),
                                                                          fit: BoxFit.fill,
                                                                        ))
                                                                    : Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: const [
                                                                          Align(
                                                                            alignment: Alignment.topCenter,
                                                                            child: Text('Ảnh mặt trước'),
                                                                          ),
                                                                          Align(
                                                                            alignment: Alignment.bottomCenter,
                                                                            child: Text(
                                                                                'Tải ảnh lên hoặc kéo thả vào đây'),
                                                                          )
                                                                        ],
                                                                      )),
                                                      )),
                                                  Expanded(
                                                      flex: 1,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          InkWell(
                                                            onTap: (() => _pickFiles(0)),
                                                            child: const Icon(Icons.upload),
                                                          ),
                                                          const Icon(Icons.camera)
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            )),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: ColorConstant.gray200,
                                              ).copyWith(),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                      flex: 7,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: ColorConstant.gray9007a,
                                                        ).copyWith(),
                                                        child: Builder(
                                                            builder: (BuildContext context) => _isLoading
                                                                ? const Padding(
                                                                    padding: EdgeInsets.only(bottom: 10.0),
                                                                    child: CircularProgressIndicator(),
                                                                  )
                                                                : _pathBackImage != null
                                                                    ? Container(
                                                                        padding: const EdgeInsets.only(bottom: 30.0),
                                                                        height:
                                                                            MediaQuery.of(context).size.height * 0.2,
                                                                        child: Image.file(
                                                                          File(_pathBackImage!
                                                                              .map((e) => e.path)
                                                                              .toList()[0]
                                                                              .toString()),
                                                                          fit: BoxFit.fill,
                                                                        ))
                                                                    : Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: const [
                                                                          Align(
                                                                            alignment: Alignment.topCenter,
                                                                            child: Text('Ảnh mặt sau'),
                                                                          ),
                                                                          Align(
                                                                            alignment: Alignment.bottomCenter,
                                                                            child: Text(
                                                                                'Tải ảnh lên hoặc kéo thả vào đây'),
                                                                          )
                                                                        ],
                                                                      )),
                                                      )),
                                                  Expanded(
                                                      flex: 1,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          InkWell(
                                                            onTap: (() => _pickFiles(1)),
                                                            child: const Icon(Icons.upload),
                                                          ),
                                                          const Icon(Icons.camera)
                                                        ],
                                                      ))
                                                ],
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  )),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      // decoration: BoxDecoration(
                      //   color: ColorConstant.gray200,
                      // ).copyWith(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorConstant.gray200,
                                ).copyWith(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text('Chọn khu vực truy vết'),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
                                        Expanded(child: Text('Địa chỉ Server')),
                                        Expanded(
                                          child: TextField(
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              labelText: '',
                                            ),
                                          ),
                                        )
                                      ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                        const Expanded(child: Text('Khu vực truy vết')),
                                        Expanded(
                                          child: DropdownButton(
                                            value: dropDownValue,
                                            icon: const Icon(Icons.keyboard_arrow_down),
                                            underline: Container(height: 0),
                                            items: items.map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(items),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                dropDownValue = newValue!;
                                              });
                                            },
                                          ),
                                        )
                                      ]),
                                    ),
                                  ],
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorConstant.gray200,
                                ).copyWith(),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text('Chọn thời gian truy vết'),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                        const Text('Thời gian bắt đầu'),
                                        Container(
                                            decoration: AppDecoration.fillWhiteA7004c.copyWith(
                                              border: Border.all(color: Colors.white, width: 8),
                                            ),
                                            child: const Text('08:00')),
                                        Container(
                                            decoration: AppDecoration.fillWhiteA7004c.copyWith(
                                              border: Border.all(color: Colors.white, width: 8),
                                            ),
                                            child: const Text('30/08/2022'))
                                      ]),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                        const Text('Thời gian bắt đầu'),
                                        Container(
                                            decoration: AppDecoration.fillWhiteA7004c.copyWith(
                                              border: Border.all(color: Colors.white, width: 8),
                                            ),
                                            child: const Text('08:00')),
                                        Container(
                                            decoration: AppDecoration.fillWhiteA7004c.copyWith(
                                              border: Border.all(color: Colors.white, width: 8),
                                            ),
                                            child: const Text('30/08/2022'))
                                      ]),
                                    ],
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorConstant.green500,
                                ).copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
                                child: Center(
                                    child: TextButton(
                                  onPressed: (() {
                                    onTapKiemtra();
                                    Get.back;
                                    Get.toNamed(AppRoutes.trackingSuccessScreenPC);
                                    //onTapKiemtra();
                                  }),
                                  child: const Text(
                                    'Bắt đầu truy vết',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )),
                              ))
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(),
        ),
      ],
    );
  }

  Widget UiTruyVetPC(BuildContext context) {
    return CustomAdminScaffold(
        backgroundColor: Colors.transparent,
        //extendBodyBehindAppBar: true,
        appBar: AppBar(
          //elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text('Truy vết đối tượng',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterMedium20.copyWith(height: 1.00)),
          centerTitle: true,
          // leading: IconButton(
          //     color: Get.isDarkMode ? Colors.white : Colors.black,
          //     onPressed: () {
          //       Get.back();
          //     },
          //     icon: const Icon(Icons.arrow_back)),
          // iconTheme: const IconThemeData(color: Colors.white),
        ),
        route: AppRoutes.trackingScreen,
        body: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height), child: UiTruyvet(context)));
  }

  Widget UiTruyVetMobile(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: const Text('Truy Vết Đối Tượng'),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SizedBox(
            width: size.width,
            child: SingleChildScrollView(
                child: SizedBox(
                    height: getVerticalSize(900.00),
                    width: size.width,
                    child: Stack(alignment: Alignment.topCenter, children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: CommonImageView(
                              imagePath: ImageConstant.imgLight2,
                              height: getVerticalSize(900.00),
                              width: getHorizontalSize(375.00))),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                              margin: getMargin(right: 1, bottom: 10),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Align(
                                        alignment: Alignment.centerLeft,
                                        child: SizedBox(
                                          height: 88,
                                        )),
                                    Container(
                                        height: getVerticalSize(632.00),
                                        width: getHorizontalSize(327.00),
                                        margin: getMargin(left: 19, top: 32, right: 19),
                                        decoration: AppDecoration.fillWhiteA700,
                                        child: Stack(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                  decoration: AppDecoration.fillWhiteA70066,
                                                  child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: Container(
                                                                width: double.infinity,
                                                                decoration: AppDecoration.fillWhiteA7004c.copyWith(
                                                                    borderRadius: BorderRadiusStyle.roundedBorder16),
                                                                child: Column(
                                                                    mainAxisSize: MainAxisSize.min,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Align(
                                                                          alignment: Alignment.center,
                                                                          child: Padding(
                                                                              padding: getPadding(
                                                                                  left: 24, top: 18, right: 24),
                                                                              child: Text("msg_info_input_head".tr,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  textAlign: TextAlign.left,
                                                                                  style: AppStyle.txtInterMedium16
                                                                                      .copyWith(height: 1.00)))),
                                                                      Padding(
                                                                          padding:
                                                                              getPadding(left: 24, top: 8, right: 24),
                                                                          child: Text("msg_enter_id_number".tr,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtInterRegular10
                                                                                  .copyWith())),
                                                                      Align(
                                                                          alignment: Alignment.center,
                                                                          child: Padding(
                                                                              padding: getPadding(
                                                                                  left: 24, top: 9, right: 24),
                                                                              child: Row(
                                                                                  mainAxisAlignment:
                                                                                      MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment:
                                                                                      CrossAxisAlignment.center,
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                        padding: getPadding(
                                                                                            top: 4, bottom: 5),
                                                                                        child: Text("lbl_id_number".tr,
                                                                                            overflow:
                                                                                                TextOverflow.ellipsis,
                                                                                            textAlign: TextAlign.left,
                                                                                            style: AppStyle
                                                                                                .txtInterMedium14
                                                                                                .copyWith(
                                                                                                    height: 1.00))),
                                                                                    CustomButton(
                                                                                        width: 160, text: "lbl_name".tr)
                                                                                  ]))),
                                                                      Padding(
                                                                          padding:
                                                                              getPadding(left: 24, top: 9, right: 24),
                                                                          child: Row(
                                                                              mainAxisAlignment:
                                                                                  MainAxisAlignment.start,
                                                                              crossAxisAlignment:
                                                                                  CrossAxisAlignment.center,
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                    padding: getPadding(top: 4),
                                                                                    child: Text("lbl_add_image".tr,
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                        textAlign: TextAlign.left,
                                                                                        style: AppStyle.txtInterMedium14
                                                                                            .copyWith(height: 1.00))),
                                                                                Padding(
                                                                                    padding: getPadding(left: 77),
                                                                                    child: Row(
                                                                                        crossAxisAlignment:
                                                                                            CrossAxisAlignment.center,
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          CommonImageView(
                                                                                              svgPath: ImageConstant
                                                                                                  .imgArrowup,
                                                                                              height: getSize(20.00),
                                                                                              width: getSize(20.00)),
                                                                                          Padding(
                                                                                              padding: getPadding(
                                                                                                  left: 42,
                                                                                                  top: 2,
                                                                                                  bottom: 1),
                                                                                              child: CommonImageView(
                                                                                                  svgPath: ImageConstant
                                                                                                      .imgCamera,
                                                                                                  height:
                                                                                                      getVerticalSize(
                                                                                                          16.00),
                                                                                                  width:
                                                                                                      getHorizontalSize(
                                                                                                          20.00)))
                                                                                        ]))
                                                                              ])),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(left: 24, right: 24),
                                                                        child: UiInputImage(context),
                                                                      ),
                                                                      Align(
                                                                          alignment: Alignment.center,
                                                                          child: Padding(
                                                                              padding: getPadding(
                                                                                  left: 24, top: 19, right: 24),
                                                                              child: Row(
                                                                                  mainAxisAlignment:
                                                                                      MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment:
                                                                                      CrossAxisAlignment.center,
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                        padding: getPadding(
                                                                                            top: 4, bottom: 5),
                                                                                        child: Text("lbl_start_date".tr,
                                                                                            overflow:
                                                                                                TextOverflow.ellipsis,
                                                                                            textAlign: TextAlign.left,
                                                                                            style: AppStyle
                                                                                                .txtInterMedium14
                                                                                                .copyWith(
                                                                                                    height: 1.00))),
                                                                                    CustomButton(
                                                                                        width: 160, text: "lbl_name".tr)
                                                                                  ]))),
                                                                      Align(
                                                                          alignment: Alignment.center,
                                                                          child: Padding(
                                                                              padding: getPadding(
                                                                                  left: 24,
                                                                                  top: 8,
                                                                                  right: 24,
                                                                                  bottom: 35),
                                                                              child: Row(
                                                                                  mainAxisAlignment:
                                                                                      MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment:
                                                                                      CrossAxisAlignment.center,
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                        padding: getPadding(
                                                                                            top: 5, bottom: 5),
                                                                                        child: Text("lbl_end_date".tr,
                                                                                            overflow:
                                                                                                TextOverflow.ellipsis,
                                                                                            textAlign: TextAlign.left,
                                                                                            style: AppStyle
                                                                                                .txtInterMedium14
                                                                                                .copyWith(
                                                                                                    height: 1.00))),
                                                                                    CustomButton(
                                                                                        width: 160, text: "lbl_name".tr)
                                                                                  ])))
                                                                    ]))),
                                                        Padding(
                                                            padding: getPadding(left: 12, top: 28, right: 12),
                                                            child: Text("msg_ch_n_khu_v_c_ki".tr,
                                                                overflow: TextOverflow.ellipsis,
                                                                textAlign: TextAlign.left,
                                                                style:
                                                                    AppStyle.txtInterMedium16.copyWith(height: 1.00))),
                                                        Container(
                                                            margin: getMargin(left: 12, top: 16, right: 12),
                                                            decoration: AppDecoration.fillWhiteA7004c.copyWith(
                                                                borderRadius: BorderRadiusStyle.roundedBorder16),
                                                            child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                mainAxisSize: MainAxisSize.max,
                                                                children: [
                                                                  Padding(
                                                                      padding:
                                                                          getPadding(left: 25, top: 22, bottom: 22),
                                                                      child: CommonImageView(
                                                                          svgPath: ImageConstant.imgCoolicon,
                                                                          height: getVerticalSize(5.00),
                                                                          width: getHorizontalSize(10.00))),
                                                                  Padding(
                                                                      padding:
                                                                          getPadding(left: 96, top: 19, bottom: 16),
                                                                      child: Text("lbl_khu_v_c".tr,
                                                                          overflow: TextOverflow.ellipsis,
                                                                          textAlign: TextAlign.left,
                                                                          style: AppStyle.txtInterMedium14
                                                                              .copyWith(height: 1.00)))
                                                                ])),
                                                        Padding(
                                                            padding: getPadding(left: 12, top: 28, right: 12),
                                                            child: Text("msg_ch_n_camera_ki".tr,
                                                                overflow: TextOverflow.ellipsis,
                                                                textAlign: TextAlign.left,
                                                                style:
                                                                    AppStyle.txtInterMedium16.copyWith(height: 1.00))),
                                                        Container(
                                                            margin: getMargin(left: 12, top: 16, right: 12),
                                                            decoration: AppDecoration.fillWhiteA7004c.copyWith(
                                                                borderRadius: BorderRadiusStyle.roundedBorder16),
                                                            child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                mainAxisSize: MainAxisSize.max,
                                                                children: [
                                                                  Padding(
                                                                      padding:
                                                                          getPadding(left: 25, top: 22, bottom: 22),
                                                                      child: CommonImageView(
                                                                          svgPath: ImageConstant.imgCoolicon,
                                                                          height: getVerticalSize(5.00),
                                                                          width: getHorizontalSize(10.00))),
                                                                  Padding(
                                                                      padding:
                                                                          getPadding(left: 96, top: 17, bottom: 18),
                                                                      child: Text("lbl_camera".tr,
                                                                          overflow: TextOverflow.ellipsis,
                                                                          textAlign: TextAlign.left,
                                                                          style: AppStyle.txtInterMedium14
                                                                              .copyWith(height: 1.00)))
                                                                ])),
                                                        CustomButton(
                                                            onTap: () {
                                                              onTapKiemtra();
                                                            },
                                                            width: 220,
                                                            text: "lbl_ki_m_tra".tr,
                                                            margin: getMargin(left: 12, top: 48, right: 12),
                                                            variant: ButtonVariant.FillWhiteA700,
                                                            shape: ButtonShape.CircleBorder16,
                                                            padding: ButtonPadding.PaddingAll8,
                                                            fontStyle: ButtonFontStyle.InterMedium16)
                                                      ])))
                                        ]))
                                  ])))
                    ])))));
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
                    color: ColorConstant.blue100, borderRadius: BorderRadius.circular(getHorizontalSize(16.00))),
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
                                    padding: const EdgeInsets.only(bottom: 30.0),
                                    height: MediaQuery.of(context).size.height * 0.2,
                                    child: Image.file(
                                      File(_pathFrontImage!.map((e) => e.path).toList()[0].toString()),
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
                    color: ColorConstant.blue100, borderRadius: BorderRadius.circular(getHorizontalSize(16.00))),
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
                                    padding: const EdgeInsets.only(bottom: 30.0),
                                    height: MediaQuery.of(context).size.height * 0.2,
                                    child: Image.file(
                                      File(_pathBackImage!.map((e) => e.path).toList()[0].toString()),
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

  void onTapKiemtra() {
    // trackingController.getTrackingData(
    //     _pathFrontImage!.map((e) => e.path).toList()[0].toString(),
    //     _pathBackImage!.map((e) => e.path).toList()[0].toString());
  }

  //TrackingController trackingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return PlatformWidgets(
        androidBuilder: UiTruyVetMobile,
        iosBuilder: UiTruyVetMobile,
        macosBuilder: UiTruyVetPC,
        windowBuilder: UiTruyVetPC,
        linuxBuilder: UiTruyVetPC,
        webBuilder: UiTruyVetPC);
  }
}
