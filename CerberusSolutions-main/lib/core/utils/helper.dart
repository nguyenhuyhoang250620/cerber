import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

GlassmorphicContainer getGlassmorphicContainer(
    {required double width,
    required double height,
    required Widget child,
    required double borderRadius,
    required double border,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin}) {
  return GlassmorphicContainer(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      border: border,
      blur: 42,
      alignment: Alignment.center,
      borderGradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
        Colors.white.withOpacity(0.1),
        Colors.white.withOpacity(0.1),
      ]),
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white.withOpacity(0.2), Colors.white.withOpacity(0.2)],
          stops: const [0.1, 1]),
      child: child);
}
