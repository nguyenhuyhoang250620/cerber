// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:cerberus_ai_system/presentation/ekyc_screen/controller/ekyc_controller.dart';

class ContentImageView extends StatelessWidget {
  ///[url] is required parameter for fetching network image
  String? url;
  String? imagePath;
  String? svgPath;
  File? file;
  double? height;
  double? width;
  final BoxFit fit;
  final String placeHolder;
  dynamic onTap;
  double? fontSize;
  dynamic paddingTop;
  int? group;

  ///a [CommonNetworkImageView] it can be used for showing any network images
  /// it will shows the placeholder image if image is not found on network
  ContentImageView({
    Key? key,
    this.url,
    this.imagePath,
    this.svgPath,
    this.file,
    this.height,
    this.width,
    this.fit = BoxFit.fill,
    this.placeHolder = 'assets/images/image_not_found.png',
    this.onTap,
    this.fontSize,
    this.paddingTop,
    this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildImageView();
  }

  Widget _buildImageView() {
    if (file != null && file!.path.isNotEmpty) {
      return Image.file(
        file!,
        height: height,
        width: width,
        fit: fit,
      );
    } else if (svgPath != null && svgPath!.isNotEmpty) {
      debugPrint('svgPath: $svgPath');
      return FittedBox(
        fit: BoxFit.contain,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              group == 1
                  ? Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text("msg_l_u_khi_ch_p".tr,
                            style: TextStyle(fontSize: fontSize)),
                      ))
                  : Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text("msg_alert_while_portrait".tr,
                            style: TextStyle(fontSize: fontSize)),
                      )),
              group == 1
                  ? Align(
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/icon_note_cam1.png',
                                height: 10,
                                width: 10,
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "msg_id_card_dont_cover_corner".tr,
                                    style: TextStyle(fontSize: fontSize),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/icon_note_cam2.png',
                                height: 10,
                                width: 10,
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "msg_id_card_dont_cover_corner".tr,
                                    style: TextStyle(fontSize: fontSize),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/icon_note_cam3.png',
                                height: 10,
                                width: 10,
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "msg_kh_ng_tay_ch".tr,
                                    style: TextStyle(fontSize: fontSize),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : Align(
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/img_portraitA.png',
                                height: 10,
                                width: 10,
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "msg_capture_direct_camera".tr,
                                    style: TextStyle(fontSize: fontSize),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/img_portraitB.png',
                                height: 10,
                                width: 10,
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "lbl_non_glasses".tr,
                                    style: TextStyle(fontSize: fontSize),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
              group == 1
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: paddingTop,
                        child: Text(
                          "lbl_upload_photos".tr,
                          style: TextStyle(fontSize: fontSize),
                        ),
                      ),
                    )
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: paddingTop,
                        child: Text(
                          "lbl_description".tr,
                          style: TextStyle(fontSize: fontSize),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      );
    } else if (url != null && url!.isNotEmpty) {
      return CachedNetworkImage(
        height: height,
        width: width,
        fit: fit,
        imageUrl: url!,
        placeholder: (context, url) => SizedBox(
          height: 30,
          width: 30,
          child: LinearProgressIndicator(
            color: Colors.grey.shade200,
            backgroundColor: Colors.grey.shade100,
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(
          placeHolder,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    } else if (imagePath != null && imagePath!.isNotEmpty) {
      // debugPrint('imagePath: $imagePath');
      return Image.asset(
        imagePath!,
        height: height,
        width: width,
        fit: fit,
      );
    }
    return const SizedBox();
  }
}
