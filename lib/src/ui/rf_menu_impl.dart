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

  /// ### The data of the current menu or submenu.
  /// Be careful with the submenus. Submenus are also independent menus and
  /// when one is opened from a parent menu (and that parent is popped and
  /// submenu is pushed), this field will point to the data of the submenu,
  /// NOT the original menu. This is true for any level of submenus.
  /// In a nutshell, this field refers to the data of menu (or submenu)
  /// that is currently visible.
  @override
  RfMenuData get menuData => super.menuData;
}
