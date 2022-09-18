// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';
import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_framework/responsive_row_column.dart';
import '../presentation/home_screen/controller/home_controller.dart';
import '../presentation/home_screen/widgets/item_feature_widget.dart';

class CustomFeatureWidget extends StatelessWidget {
  final HomeController controller;
  const CustomFeatureWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxList item = controller.homeModelObj.value.featureData;
    return Flex(direction: Axis.vertical, children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(left: 29, top: 20, right: 29, bottom: 12),
                  child: Text(
                    "msg_de_xuat_hang_dau".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.commonTextStyle,
                  ),
                ),
              ),
              FittedBox(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 320,
                  child: Obx(
                    () => ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      }),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(right: 12),
                        children: [
                          ItemFeatureWidget(item[0]),
                          ItemFeatureWidget(item[1]),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(left: 29, top: 20, right: 29, bottom: 12),
                  child: Text(
                    "msg_de_xuat_hang_dau".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.commonTextStyle,
                  ),
                ),
              ),
              FittedBox(
                child: SizedBox(
                  height: 320,
                  child: Obx(
                    () => ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                      }),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(right: 12),
                        children: [
                          FittedBox(
                            child: ResponsiveRowColumn(
                              layout: ResponsiveRowColumnType.ROW,
                              children: [
                                ResponsiveRowColumnItem(child: ItemFeatureWidget(item[2])),
                                ResponsiveRowColumnItem(child: ItemFeatureWidget(item[3])),
                                ResponsiveRowColumnItem(child: ItemFeatureWidget(item[4]))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ]);
  }
}
