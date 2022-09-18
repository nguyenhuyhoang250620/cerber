import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

const curberusTitle = 'Cerberus Ai System';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final _lightModeText = ["Light", "Dark"];
  final _selectedBackgroundColors = [
    ColorConstant.whiteA700,
    ColorConstant.gray200,
    //Color.fromARGB(1, 1, 1, 1),
    //Color.fromARGB(255, 255, 255, 255)
  ];
  final _listIconTabToggle = [
    Icons.sunny,
    Icons.nightlight_round,
  ];
  var _tabTextIconIndexSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConstant.whiteA700,
      child: Stack(
        children: [
          ListView(
            controller: ScrollController(),
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          24.00,
                        ),
                      ),
                      child: CommonImageView(
                        imagePath: ImageConstant.img81,
                        height: getSize(
                          48.00,
                        ),
                        width: getSize(
                          48.00,
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 12,
                        top: 17,
                        bottom: 15,
                      ),
                      child: Text(
                        "Cerberus Ai System",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ColorConstant.gray900,
                          fontSize: getFontSize(
                            15,
                          ),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 1.00,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              getListTile('assets/images/img_home.png', 'Home', onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.homeScreen);
              }),

              // chua co screen cho list duoi nen tam thoi Get.to HomeScreen
              getListTile('assets/images/coolicon.png', 'Hướng dẫn sử dụng', onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.homeScreen);
              }),

              ExpansionTile(
                leading: SizedBox(
                    height: 20.0,
                    width: 20.0, // fixed width and height
                    child: Image.asset('assets/images/box.png')),
                title: Text(
                  'Sản phẩm và dịch vụ',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: ColorConstant.bluegray700,
                    fontSize: getFontSize(
                      15,
                    ),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 1.00,
                  ),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 58),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              'Định danh điện tử - eKYC',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.bluegray700,
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 1.00,
                              ),
                            ),
                            onTap: () {
                              Get.toNamed(AppRoutes.homeScreen);
                            },
                          ),
                          ListTile(
                            title: Text(
                              'Kiểm soát khu vực',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.bluegray700,
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 1.00,
                              ),
                            ),
                            onTap: () {
                              Get.back();
                              Get.toNamed(AppRoutes.ekycScreen);
                            },
                          ),
                          ListTile(
                            title: Text(
                              'Giám sát giao thông',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.bluegray700,
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 1.00,
                              ),
                            ),
                            onTap: () {
                              Get.back();
                              Get.toNamed(AppRoutes.trackingSuccessScreen);
                            },
                          ),
                          ListTile(
                            title: Text(
                              'Nhận diện truy vết',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.bluegray700,
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 1.00,
                              ),
                            ),
                            onTap: () {
                              Get.back();
                              Get.toNamed(AppRoutes.trackingScreen);
                            },
                          ),
                          ListTile(
                            title: Text(
                              'Các nghiệp vụ khác',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.bluegray700,
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 1.00,
                              ),
                            ),
                            onTap: () {
                              Get.back();
                              Get.toNamed(AppRoutes.trackingScreen);
                            },
                          ),
                          ListTile(
                            title: Text(
                              'Camera preview',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorConstant.bluegray700,
                                fontSize: getFontSize(
                                  15,
                                ),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 1.00,
                              ),
                            ),
                            onTap: () {
                              Get.back();
                              Get.toNamed(AppRoutes.cameraPreview);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              getListTile('assets/images/img_info.png', 'Về Cerberus', onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.homeScreen);
              }),
              getListTile('assets/images/img_setting.png', 'Setting', onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.homeScreen);
              }),
              getListTile('assets/images/img_support.png', 'Support', onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.homeScreen);
              }),
              //camera preview

              const SizedBox(
                height: 100,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              // margin: getMargin(
              //   //left: 24,
              //   top: 328,
              //   //right: 24,
              //   //bottom: 24,
              // ),
              decoration: BoxDecoration(
                color: ColorConstant.whiteA700,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(
                    20.00,
                  ),
                ),
              ),
              child: SizedBox(
                height: 50,
                child: Center(child: CustomToggleTab(context)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget CustomToggleTab(BuildContext) {
    return FlutterToggleTab(
      width: 30,
      height: 30,
      borderRadius: 30,
      marginSelected: const EdgeInsets.all(2),
      selectedTextStyle: const TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w600),
      unSelectedTextStyle: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
      labels: _lightModeText,
      icons: _listIconTabToggle,
      selectedIndex: _tabTextIconIndexSelected,
      selectedBackgroundColors: _selectedBackgroundColors,
      selectedLabelIndex: (index) {
        print(index);
        if (index == 0) {
          Get.changeTheme(ThemeData.light());
        } else {
          Get.changeTheme(ThemeData.dark());
        }

        setState(() {
          _tabTextIconIndexSelected = index;
        });
      },
    );
  }

  Widget getListTile(String pathIcon, title, {Function()? onTap}) {
    return ListTile(
      leading: SizedBox(
          height: 20.0,
          width: 20.0, // fixed width and height
          child: Image.asset(
            pathIcon,
          )),
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: ColorConstant.bluegray700,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          height: 1.00,
        ),
      ),
      onTap: onTap,
    );
  }
}
