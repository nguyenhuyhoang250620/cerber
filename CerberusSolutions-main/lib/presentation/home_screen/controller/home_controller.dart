import '/core/app_export.dart';
import 'package:cerberus_ai_system/presentation/home_screen/models/home_model.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  TextEditingController inputTextController = TextEditingController();

  Rx<HomeModel> homeModelObj = HomeModel().obs;

  Rx<int> silderIndex = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    inputTextController.dispose();
  }
}
