import 'package:cerberus_ai_system/core/utils/color_constant.dart';
import 'package:flutter/material.dart';

import 'admin_menu_item.dart';

class SideBarItem extends StatelessWidget {
  const SideBarItem({
    required this.items,
    required this.index,
    this.onSelected,
    required this.selectedRoute,
    this.depth = 0,
    this.iconColor,
    this.activeIconColor,
    required this.textStyle,
    required this.activeTextStyle,
    required this.backgroundColor,
    required this.activeBackgroundColor,
    required this.borderColor,
  });

  final List<AdminMenuItem> items;
  final int index;
  final void Function(AdminMenuItem item)? onSelected;
  final String selectedRoute;
  final int depth;
  final Color? iconColor;
  final Color? activeIconColor;
  final TextStyle textStyle;
  final TextStyle activeTextStyle;
  final Color backgroundColor;
  final Color activeBackgroundColor;
  final Color borderColor;
  bool get isLast => index == items.length - 1;

  @override
  Widget build(BuildContext context) {
    if (depth > 0 && isLast) {
      return _buildTiles(context, items[index]);
    }
    return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: borderColor,
            ),
          ),
        ),
        child: _buildTiles(context, items[index]));
  }

  Widget _buildTiles(BuildContext context, AdminMenuItem item) {
    bool selected = _isSelected(selectedRoute, [item]);

    if (item.children.isEmpty) {
      return Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        margin: const EdgeInsets.only(left: 16, right: 16),
        // margin: getMargin(
        //               left: 19,
        //               top: 20,
        //               right: 19,
        //             ),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20),
        // ),
        decoration: selected
            ? BoxDecoration(
                color: activeBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              )
            : null,

        child: ListTile(
          contentPadding: const EdgeInsets.all(4),
          leading: _buildIcon(item.pathImage, selected),
          title: _buildTitle(item.title, selected),
          selected: selected,
          tileColor: backgroundColor,
          //selectedTileColor: activeBackgroundColor,
          onTap: () {
            if (onSelected != null) {
              onSelected!(item);
            }
          },
        ),
      );
    }

    int index = 0;
    final childrenTiles = item.children.map((child) {
      return SideBarItem(
        items: item.children,
        index: index++,
        onSelected: onSelected,
        selectedRoute: selectedRoute,
        depth: depth + 1,
        iconColor: iconColor,
        activeIconColor: activeIconColor,
        textStyle: textStyle,
        activeTextStyle: activeTextStyle,
        backgroundColor: backgroundColor,
        activeBackgroundColor: activeBackgroundColor,
        borderColor: borderColor,
      );
    }).toList();

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.red),
      child: ExpansionTile(
        tilePadding: _getTilePadding(depth),
        leading: _buildIcon(item.pathImage),
        title: _buildTitle(item.title),
        initiallyExpanded: selected,
        children: childrenTiles,
      ),
    );
  }

  bool _isSelected(String route, List<AdminMenuItem> items) {
    for (final item in items) {
      if (item.route == route) {
        return true;
      }
      if (item.children.isNotEmpty) {
        return _isSelected(route, item.children);
      }
    }
    return false;
  }

  Widget _buildIcon(IconData? pathImage, [bool selected = false]) {
    return pathImage != null
        ? SizedBox(
            height: 20,
            width: 20,
            child: Icon(
              pathImage,
              color: selected ? Colors.white : ColorConstant.primaryIcon,
            ),
          )
        : SizedBox();
  }

  Widget _buildTitle(String title, [bool selected = false]) {
    return Text(
      title,
      style: selected ? activeTextStyle : textStyle,
    );
  }

  EdgeInsets _getTilePadding(int depth) {
    return EdgeInsets.only(
      left: 10.0 + 10.0 * depth,
      right: 10.0,
    );
  }
}
