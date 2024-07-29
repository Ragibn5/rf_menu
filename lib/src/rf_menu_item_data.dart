import 'package:flutter/widgets.dart';

import 'rf_menu_data.dart';

class RfMenuItemData {
  final String itemTitle;
  final String? itemIconPath;
  final IconData? itemIconData;
  final RfMenuData? subMenuData;
  final Function()? onItemAction;

  RfMenuItemData({
    required this.itemTitle,
    this.itemIconPath,
    this.itemIconData,
    this.subMenuData,
    this.onItemAction,
  });
}