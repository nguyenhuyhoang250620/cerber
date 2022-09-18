import 'package:cerberus_ai_system/presentation/tracking_feature/controller/tracking_controller.dart';
import 'package:cerberus_ai_system/widgets/platformwidgets.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:cerberus_ai_system/core/app_export.dart';

class CustomTrackingResult extends StatefulWidget {
  const CustomTrackingResult({Key? key}) : super(key: key);

  @override
  State<CustomTrackingResult> createState() => _CustomTrackingResultState();
}

class _CustomTrackingResultState extends State<CustomTrackingResult> {
  PageController page = PageController();
  final trackingController = Get.find<TrackingController>();
  Widget UiTruyVetPC(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Truy vết',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            color: Get.isDarkMode ? Colors.white : Colors.black,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: page,
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
            ),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: Image.asset(
                    'assets/images/img_81.png',
                  ),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'ahihi',
                style: TextStyle(fontSize: 15),
              ),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Trang chủ',
                onTap: () {
                  page.jumpToPage(0);
                },
                icon: const Icon(Icons.menu),
              ),
              SideMenuItem(
                priority: 1,
                title: 'Ahihi',
                onTap: () {
                  page.jumpToPage(1);
                },
                icon: const Icon(Icons.menu),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                UiTrackingResult(context),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Ahihi',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget UiTrackingResult(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 40, right: 20, top: 20, bottom: 20),
        child: Obx(
          () => (Row(
            children: [
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  color: ColorConstant.gray200,
                ).copyWith(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                      child: Center(
                        child: Text('Thông tin đối tượng'),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorConstant.gray9007a,
                          ).copyWith(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            child: Image.asset(
                                              'assets/images/img_81.png',
                                            ),
                                          )),
                                      Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                  'ID định danh: ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.soCmt}'),
                                              Text(
                                                  'Họ tên: ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.hoVaTen}'),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                          'Ngày sinh: ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.namSinh}')),
                                                  Expanded(
                                                      child: Text(
                                                          'Giới tính: ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.gioiTinh}')),
                                                ],
                                              )
                                            ],
                                          ))
                                    ],
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                      'Địa chỉ thường trú: ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.noiTru}')),
                              Expanded(
                                  flex: 1,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Text(
                                              'Dân tộc: ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.quocTich}')),
                                      const Expanded(child: Text('Tôn giáo: null')),
                                      Expanded(
                                          child: Text(
                                              'Quốc tịch: ${trackingController.isLoading ? null : trackingController.trackingModel.ocrData.quocTich}'))
                                    ],
                                  )),
                              const Expanded(flex: 1, child: SizedBox()),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                      child: Center(
                        child: Text('Kết quả'),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                            decoration: BoxDecoration(
                              color: ColorConstant.gray9007a,
                            ).copyWith(),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Container(
                                        child: Image.asset(
                                          'assets/images/img_81.png',
                                        ),
                                      ),
                                    )),
                                Expanded(
                                    flex: 4,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: const [Text('Thời gian:'), Text('Địa điểm:')],
                                    ))
                              ],
                            ))),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                            decoration: BoxDecoration(
                              color: ColorConstant.gray9007a,
                            ).copyWith(),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Image.asset(
                                        'assets/images/img_81.png',
                                      ),
                                    )),
                                Expanded(
                                    flex: 4,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: const [Text('Thời gian:'), Text('Địa điểm:')],
                                    ))
                              ],
                            ))),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                            decoration: BoxDecoration(
                              color: ColorConstant.gray9007a,
                            ).copyWith(),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Container(
                                        child: Image.asset(
                                          'assets/images/img_81.png',
                                        ),
                                      ),
                                    )),
                                Expanded(
                                    flex: 4,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: const [Text('Thời gian:'), Text('Địa điểm:')],
                                    ))
                              ],
                            ))),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  color: ColorConstant.gray200,
                ).copyWith(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                              decoration: BoxDecoration(
                                color: ColorConstant.gray9007a,
                              ).copyWith(),
                              child: Container())),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Thời gian:'),
                                  Text('Địa điểm:'),
                                  Text('ID camera:'),
                                  Text('Loại camera:'),
                                  SizedBox(
                                    height: 30,
                                  )
                                ]),
                          ))
                    ],
                  ),
                ),
              ))
            ],
          )),
        ));
  }

  Widget UiTruyVetMobile(BuildContext context) {
    return Container();
  }

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
