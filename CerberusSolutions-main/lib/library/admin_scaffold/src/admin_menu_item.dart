import 'package:flutter/material.dart';

class AdminMenuItem {
  const AdminMenuItem({
    required this.title,
    this.route,
    this.pathImage,
    this.children = const [],
  });

  final String title;
  final String? route;
  final IconData? pathImage;
  final List<AdminMenuItem> children;
}
