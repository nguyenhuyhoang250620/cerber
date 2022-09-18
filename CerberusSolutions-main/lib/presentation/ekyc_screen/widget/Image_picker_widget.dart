import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:cerberus_ai_system/presentation/ekyc_screen/controller/ekyc_controller.dart';

import '../ekyc_camera.dart';
import 'ekyc_image_view.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({
    super.key,
    required this.title,
    required this.pathSvgDefaltImage,
    required this.pathImageSelected,
    required this.cameraID,
    required this.aspectRatio,
    required this.controller,
    required this.group,
  });

  final String title;
  final String pathSvgDefaltImage;
  final String pathImageSelected;
  final int cameraID;
  final AspectRatio aspectRatio;
  final EkycController controller;
  final int group;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Wrap(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 0, top: 0),
              padding:
                  const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 5),
              // decoration: BoxDecoration(color: ColorConstant.gray200, borderRadius: BorderRadius.circular(15)),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppStyle.txtInterMedium16.copyWith().apply(
                    fontSizeFactor:
                        ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                            ? 0.8
                            : 1.0),
              ),
            ),
            FittedBox(
              child: Column(
                children: [
                  pathImageSelected == ''
                      ? group == 1
                          ? ContentImageView(
                              group: 1,
                              svgPath: pathSvgDefaltImage,
                              paddingTop: EdgeInsets.all(0),
                              fontSize: ResponsiveWrapper.of(context)
                                      .isSmallerThan(DESKTOP)
                                  ? ResponsiveWrapper.of(context)
                                          .isSmallerThan(TABLET)
                                      ? 10
                                      : 10
                                  : 16,
                              height: ResponsiveWrapper.of(context)
                                      .isSmallerThan(TABLET)
                                  ? 8.h
                                  : 15.h)
                          : ContentImageView(
                              svgPath: pathSvgDefaltImage,
                              paddingTop: EdgeInsets.all(0),
                              fontSize: ResponsiveWrapper.of(context)
                                      .isSmallerThan(DESKTOP)
                                  ? ResponsiveWrapper.of(context)
                                          .isSmallerThan(TABLET)
                                      ? 10
                                      : 10
                                  : 14,
                              height: ResponsiveWrapper.of(context)
                                      .isSmallerThan(TABLET)
                                  ? 8.h
                                  : 15.h)
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Container(
                              height: ResponsiveWrapper.of(context)
                                      .isSmallerThan(DESKTOP)
                                  ? ResponsiveWrapper.of(context)
                                          .isSmallerThan(TABLET)
                                      ? 7.h
                                      : 12.h
                                  : group == 1
                                      ? 18.h
                                      : 20.h,
                              width: ResponsiveWrapper.of(context)
                                      .isSmallerThan(DESKTOP)
                                  ? group == 1
                                      ? 14.7.w
                                      : 9.w
                                  : group == 1
                                      ? 22.w
                                      : 14.w,
                              child: Wrap(
                                children: [
                                  AspectRatio(
                                      // borderRadius: BorderRadius.circular(10.0),
                                      aspectRatio: group == 1 ? 85 / 53 : 1,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(34.0),
                                        child:
                                            Image.network(controller.qrValue),
                                      ))
                                ],
                              )),
                        ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                                onTap: () {
                                  controller.pickImage(cameraID);
                                  // controller.pickFiles(cameraID);
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.file_upload_outlined,
                                    size: 26,
                                  ),
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            content: Builder(
                                              builder: (context) {
                                                // Get available height and width of the build area of this widget. Make a choice depending on the size.

                                                return Container(
                                                  height: 80.h,
                                                  width: 40.w,
                                                  child: CameraApp(),
                                                );
                                              },
                                            ),
                                          ));
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 26,
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
