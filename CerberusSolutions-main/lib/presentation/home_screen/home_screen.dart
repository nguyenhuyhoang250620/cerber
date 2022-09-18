import 'dart:ui';
import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/presentation/home_screen/controller/home_controller.dart';
import 'package:cerberus_ai_system/widgets/custom_admin_scaffold.dart';
import 'package:cerberus_ai_system/widgets/custom_feature_widget.dart';
import 'package:cerberus_ai_system/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:play_kit/play_kit.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAdminScaffold(
        route: AppRoutes.homeScreen,
        pathImageBackground: Constants.backgroundPath,
        appBar: AppBar(),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(
                              height: 44,
                            ),
                            CustomSearchView(
                              width: size.width,
                              focusNode: FocusNode(),
                              controller: controller.inputTextController,
                              hintText: "txt_title_search".tr,
                              margin: getMargin(
                                left: 16,
                                top: 20,
                                right: 16,
                              ),
                              alignment: Alignment.center,
                              suffix: Padding(
                                padding: getPadding(
                                  left: 15,
                                  right: 15,
                                ),
                                child: IconButton(
                                  onPressed: controller.inputTextController.clear,
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ),
                            Center(child: CustomFeatureWidget(controller: controller)),
                          ],
                        )
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
