import 'package:flutter/material.dart';
import 'package:cerberus_ai_system/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get outlineBlack9003f => BoxDecoration(
        color: ColorConstant.whiteA7004c,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineIndigoA40012 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.indigoA400,
          width: getHorizontalSize(
            1,
          ),
        ),
      );
  static BoxDecoration get outlineIndigoA400 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.indigoA400,
          width: getHorizontalSize(
            1.12,
          ),
        ),
      );
  static BoxDecoration get outlineQuangCao => BoxDecoration(
        color: ColorConstant.primaryBackground,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.primaryBackground,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get gradientWhiteA70033WhiteA70033 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            1.0166667190474261,
            0.49999997456829637,
          ),
          end: Alignment(
            -0.24444442004291544,
            0.4999999464403002,
          ),
          colors: [
            ColorConstant.whiteA70033,
            ColorConstant.whiteA70033,
          ],
        ),
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get fillWhiteA7007f => BoxDecoration(
        color: ColorConstant.whiteA7007f,
      );
  static BoxDecoration get fillWhiteA70066 => BoxDecoration(
        color: ColorConstant.whiteA70066,
      );
  static BoxDecoration get fillWhiteA70099 => BoxDecoration(
        color: ColorConstant.whiteA70099,
      );
  static BoxDecoration get fillWhiteA7004c => BoxDecoration(
        color: ColorConstant.primaryBackground,
      );
  static BoxDecoration get txtFillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );

  static BoxDecoration get fillGray50 => BoxDecoration(
        color: ColorConstant.gray50,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10.00,
    ),
  );
  static BorderRadius roundedBorder16 = BorderRadius.circular(
    getHorizontalSize(
      10.00,
    ),
  );

  static BorderRadius circleBorder10 = BorderRadius.circular(
    getHorizontalSize(
      10.00,
    ),
  );

  static BorderRadius txtCircleBorder8 = BorderRadius.circular(
    getHorizontalSize(
      8.00,
    ),
  );

  static BorderRadius txtCircleBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12.00,
    ),
  );
  static BorderRadius roundedBorder9 = BorderRadius.circular(
    getHorizontalSize(
      9.10,
    ),
  );
  static BorderRadius roundedBorder2 = BorderRadius.circular(
    getHorizontalSize(
      2.00,
    ),
  );
}
