import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/core/utils/helper.dart';
import 'package:cerberus_ai_system/library/admin_scaffold/src/admin_menu_item.dart';
import 'package:cerberus_ai_system/library/admin_scaffold/src/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:cerberus_ai_system/library/admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../app/drawer_menu.dart';

class CustomAdminScaffold extends StatelessWidget {
  CustomAdminScaffold(
      {Key? key,
      this.appBar,
      required this.route,
      required this.body,
      this.backgroundColor,
      this.pathImageBackground})
      : super(key: key);
  final AppBar? appBar;
  final Widget body;
  final String route;
  final Color? backgroundColor;
  final String? pathImageBackground;
  final List<AdminMenuItem> _sideBarItems = [
    const AdminMenuItem(
        title: 'Home', route: AppRoutes.homeScreen, pathImage: Icons.home),
    const AdminMenuItem(
        title: 'Hướng dẫn sử dụng',
        route: AppRoutes.introductionApp,
        pathImage: Icons.book),
    const AdminMenuItem(
      title: 'Sản Phẩm dịch vụ',
      pathImage: Icons.library_books,
      children: [
        AdminMenuItem(
            title: 'Định danh điện tử - eKYC',
            route: AppRoutes.ekycScreen,
            pathImage: null),
        AdminMenuItem(
            title: 'Kiểm soát khu vực',
            route: AppRoutes.areaControlling,
            pathImage: null),
        AdminMenuItem(
            title: 'Giám sát giao thông',
            route: AppRoutes.vmsScreen,
            pathImage: null),
        AdminMenuItem(
            title: 'Vms', route: AppRoutes.vmsScreen, pathImage: null),
        AdminMenuItem(
            title: 'Nhận diện truy vết',
            route: AppRoutes.trackingScreen,
            pathImage: null),
        AdminMenuItem(
            title: 'Các nghiệp vụ khác',
            route: AppRoutes.otherFeatureScreen,
            pathImage: null),
        AdminMenuItem(
            title: 'Camera preview',
            route: AppRoutes.cameraPreview,
            pathImage: null),
      ],
    ),
    const AdminMenuItem(
      title: 'Về Cerberus',
      route: AppRoutes.aboutCerberus,
      pathImage: Icons.info,
    ),
    const AdminMenuItem(
        title: 'Setting',
        route: AppRoutes.settingScreen,
        pathImage: Icons.settings),
    const AdminMenuItem(
        title: 'Support',
        route: AppRoutes.supportScreen,
        pathImage: Icons.call),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: appBar,
      backgroundColor: Colors.transparent,

      pathImageBackground: pathImageBackground,
      sideBar: SideBar(
        width: 400,
        backgroundColor: Colors.transparent,
        activeBackgroundColor: Colors.blue,
        borderColor: const Color(0xFFE7E7E7),
        iconColor: ColorConstant.textPrimary,
        activeIconColor: Colors.blue,
        textStyle: AppStyle.commonTextStyle,
        activeTextStyle: AppStyle.commonTextStyle.copyWith(color: Colors.white),
        items: _sideBarItems,
        selectedRoute: route,
        onSelected: (item) {
          print(
              'sideBar: onTap(): title = ${item.title}, route = ${item.route}');
          if (item.route != null && item.route != route) {
            Get.toNamed(item.route!);
            //Navigator.of(context).pushNamed(item.route!);
          }
        },
        header: getGlassmorphicContainer(
            width: 400,
            height: 100,
            borderRadius: 0,
            border: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                color: Colors.transparent,
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
                        left: 4,
                        right: 4,
                        top: 16,
                        bottom: 16,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "CERBERUS AI SYSTEM",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style:
                              AppStyle.commonTextStyle.copyWith(fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
        footer: getGlassmorphicContainer(
          height: 50,
          width: double.infinity,
          border: 1,
          borderRadius: 0,
          child: const Center(
            child: Text(
              'Ahihi Cerberus',
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
      //body: body,
    );
  }
}
