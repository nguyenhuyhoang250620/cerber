import '../../../core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

// ignore: must_be_immutable
class ListEKYCItemWidget extends StatelessWidget {
  ListEKYCItemWidget(this.title, this.isFaceInfo, this.data, {super.key});

  String title;
  bool isFaceInfo;
  String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(
        top: 8.0,
        bottom: 8.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: getPadding(
              top: 4,
              bottom: 5,
            ),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterMedium14
                  .copyWith(
                    height: 1.00,
                  )
                  .apply(
                      fontSizeFactor:
                          ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                              ? 0.8
                              : 1.0),
            ),
          ),
          isFaceInfo
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 2,
                        bottom: 3,
                      ),
                      child: Text(
                        data,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: data == "matching".tr
                            ? AppStyle.txtInterMedium14Green800
                                .copyWith(
                                  height: 1.00,
                                )
                                .apply(
                                    fontSizeFactor:
                                        ResponsiveWrapper.of(context)
                                                .isSmallerThan(TABLET)
                                            ? 0.8
                                            : 1.0)
                            : AppStyle.txtInterMedium14Red300
                                .copyWith(
                                  height: 1.00,
                                )
                                .apply(
                                    fontSizeFactor:
                                        ResponsiveWrapper.of(context)
                                                .isSmallerThan(TABLET)
                                            ? 0.8
                                            : 1.0),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 5,
                      ),
                      child: CommonImageView(
                        svgPath: data == "matching".tr
                            ? ImageConstant.imgPassed
                            : ImageConstant.imgFailed,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ],
                )
              : Flexible(
                  child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorConstant.whiteA700,
                  ),
                  child: Padding(
                    padding: getPadding(
                        left:
                            ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                                ? 2
                                : 5,
                        right:
                            ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                                ? 2
                                : 5,
                        top: 7,
                        bottom: 5),
                    child: Text(
                      data,
                      maxLines: 3,
                      // overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtInterMedium11
                          .copyWith(
                            height: 1.00,
                            color: ColorConstant.primaryText,
                          )
                          .apply(
                              fontSizeFactor: ResponsiveWrapper.of(context)
                                      .isSmallerThan(TABLET)
                                  ? 0.8
                                  : 1.0),
                    ),
                  ),
                )),
        ],
      ),
    );
  }
}
