import 'rf_menu_data.dart';

class RfMenuItemData {
  final String itemTitle;
  final String? itemIconPath;
  final RfMenuData? subMenuData;
  final Function()? onItemAction;

  RfMenuItemData({
    required this.itemTitle,
    this.itemIconPath,
    this.subMenuData,
    this.onItemAction,
  });
}
