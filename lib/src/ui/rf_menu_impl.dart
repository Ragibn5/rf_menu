import 'package:flutter/material.dart';
import 'package:rf_menu/src/models/rf_menu_data.dart';
import 'package:rf_menu/src/models/rf_menu_item_data.dart';
import 'package:rf_menu/src/ui/rf_menu_view.dart';

/// ### Extend this class to create a menu that supports nested menus.
/// This class handles auto popping of the current page,
/// and optionally requests for opening the submenu (if there is any).
/// <br><br>
/// If you do not want to handle auto popping and submenu routing,
/// please use [RfMenuView]. This can be the case if you just want to
/// create a menu view in a static screen or fragment or something like that.
abstract class RfMenu extends RfMenuView {
  final void Function(RfMenuData submenuData) _onSubmenuRequest;

  const RfMenu({
    super.key,
    required super.menuData,
    required void Function(RfMenuData menuData) onSubmenuRequest,
  }) : _onSubmenuRequest = onSubmenuRequest;

  @override
  void onItemTap(BuildContext context, RfMenuItemData itemData) {
    Navigator.pop(context);

    itemData.onItemAction?.call();
    if ((itemData.subMenuData?.menuItems ?? []).isNotEmpty) {
      _onSubmenuRequest(itemData.subMenuData!);
    }
  }
}
