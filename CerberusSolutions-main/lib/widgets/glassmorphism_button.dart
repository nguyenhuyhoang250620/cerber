import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassmorphismButton extends StatelessWidget {
  GlassmorphismButton({this.height,
    this.padding,
    this.alignment,
    this.onTap,
    this.width,
    this.margin,
    required this.borderRadius,
    this.text});

  double borderRadius;

  EdgeInsetsGeometry? padding;

  Alignment? alignment;

  VoidCallback? onTap;

  double? width;

  double? height;

  EdgeInsetsGeometry? margin;

  String? text;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment ?? Alignment.center,
      child: _buildButtonWidget(),
    )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    // return InkWell(
    //   onTap: onTap,
    //   child: Container(
    //     width: getHorizontalSize(width ?? 0),
    //     margin: margin,
    //     padding: _setPadding(),
    //     decoration: _buildDecoration(),
    //     child: Text(
    //       text ?? "",
    //       textAlign: TextAlign.center,
    //       style: _setFontStyle(),
    //     ),
    //   ),
    // );
    return TextButton(
      onPressed: onTap,
      child: GlassmorphicContainer(
        width: getHorizontalSize(width ?? 0),
        margin: margin,
        height: getVerticalSize(height ?? 0),
        padding: padding,
        borderRadius: borderRadius,
        border: 2,
        blur: 42,
        alignment: Alignment.center,
        borderGradient: LinearGradient(
            begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
          Colors.white.withOpacity(0.1),
          Colors.white.withOpacity(0.1),
        ]),
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.indigoAccent.withOpacity(0.6),
              Colors.blue.withOpacity(0.6),
            ],
            stops: const [0.1, 1]),
        child: Text(
          text ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
