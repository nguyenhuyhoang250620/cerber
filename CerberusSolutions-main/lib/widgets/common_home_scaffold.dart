import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/library/admin_scaffold/src/admin_menu_item.dart';
import 'package:cerberus_ai_system/library/admin_scaffold/src/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:cerberus_ai_system/library/admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../presentation/ekyc_screen/ekyc_result_match_screen.dart';

class CommonHomeScaffold extends StatelessWidget {
  const CommonHomeScaffold({Key? key, this.appBar, required this.route, required this.body, this.backgroundColor})
      : super(key: key);
  final AppBar? appBar;
  final Widget body;
  final String route;
  final Color? backgroundColor;

  final List<AdminMenuItem> _sideBarItems = const [
    AdminMenuItem(
      title: 'Trang chủ',
      route: '/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      sideBar: SideBar(
        width: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP) ? 0 : 400,
        backgroundColor: const Color(0xFFEEEEEE),
        activeBackgroundColor: Colors.black26,
        borderColor: const Color(0xFFE7E7E7),
        //iconColor: Colors.black87,
        //activeIconColor: Colors.blue,
        textStyle: const TextStyle(
          color: Color(0xFF337ab7),
          fontSize: 13,
        ),
        activeTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
        items: _sideBarItems,
        selectedRoute: route,
        onSelected: (item) {
          print('sideBar: onTap(): title = ${item.title}, route = ${item.route}');
          if (item.route != null && item.route != route) {
            Get.toNamed(item.route!);
            //Navigator.of(context).pushNamed(item.route!);
          }
        },
        header: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          child: Container(
            margin: const EdgeInsets.only(bottom: 8.0),
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
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.00,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'Ahihi Cerberus',
              style: TextStyle(
                color: Colors.white,
              ),
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
