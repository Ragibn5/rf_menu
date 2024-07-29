import 'package:rf_menu/rf_menu.dart';
import 'package:rf_menu/src/menu_body_config.dart';
import 'package:rf_menu/src/menu_header_config.dart';

class RfMenuData {
  final MenuBodyConfig? bodyConfig;
  final MenuHeaderConfig? headerConfig;
  final List<RfMenuItemData> menuItems;

  RfMenuData({
    this.bodyConfig,
    this.headerConfig,
    required this.menuItems,
  });
}
