import 'package:rf_menu/rf_menu.dart';
import 'package:rf_menu/src/configs/menu_item_config.dart';
import 'package:rf_menu/src/configs/menu_item_separator_config.dart';

class RfMenuData {
  final MenuItemConfig? menuItemConfig;
  final MenuItemSeparatorConfig? menuItemSeparatorConfig;

  final MenuBodyConfig? menuBodyConfig;
  final MenuHeaderConfig? menuHeaderConfig;

  final List<RfMenuItemData> menuItems;

  RfMenuData({
    this.menuItemConfig,
    this.menuItemSeparatorConfig,
    this.menuBodyConfig,
    this.menuHeaderConfig,
    required this.menuItems,
  });
}
