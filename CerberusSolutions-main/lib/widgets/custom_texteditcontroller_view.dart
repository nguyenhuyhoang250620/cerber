import 'package:cerberus_ai_system/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextEditController extends StatefulWidget {
  CustomTextEditController(
      {Key? key,
      this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints})
      : super(key: key);

  TextEditControllerViewShape? shape;
  EdgeInsetsGeometry? padding;
  TextEditControllerViewVariant? variant;

  TextEditControllerViewFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  @override
  State<CustomTextEditController> createState() =>
      _CustomTextEditControllerState();
}

class _CustomTextEditControllerState extends State<CustomTextEditController> {
  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: _buildTextEditControllerViewWidget(),
          )
        : _buildTextEditControllerViewWidget();
  }

  _buildTextEditControllerViewWidget() {
    return Container(
      width: getHorizontalSize(widget.width ?? 0),
      margin: widget.margin,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        style: _setFontStyle(),
        decoration: _buildDecoration(),
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: widget.hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: widget.prefix,
      prefixIconConstraints: widget.prefixConstraints,
      suffixIcon: widget.suffix,
      suffixIconConstraints: widget.suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (widget.fontStyle) {
      default:
        return TextStyle(
          color: ColorConstant.primaryText,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (widget.shape) {
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            15.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (widget.variant) {
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
    }
  }

  _setFillColor() {
    switch (widget.variant) {
      default:
        return ColorConstant.primaryBackground;
    }
  }

  _setFilled() {
    switch (widget.variant) {
      case TextEditControllerViewVariant.FillWhiteA7004c:
        return true;
      default:
        return true;
    }
  }

  _setPadding() {
    switch (widget.padding) {
      default:
        return getPadding(
          left: 2,
          top: 10,
          right: 2,
          bottom: 10,
        );
    }
  }
}

enum TextEditControllerViewShape {
  CircleBorder25,
}

enum TextEditControllerViewPadding {
  PaddingTB17,
}

enum TextEditControllerViewVariant {
  FillWhiteA7004c,
}

enum TextEditControllerViewFontStyle {
  InterRegular16,
}
