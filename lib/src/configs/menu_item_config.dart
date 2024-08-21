import 'package:flutter/widgets.dart';
import 'package:rf_menu/src/contracts/passthrough_contract.dart';

class MenuItemConfig implements PassthroughContract {
  final EdgeInsets? menuItemPadding;

  MenuItemConfig({this.menuItemPadding});

  @override
  bool isPassthrough() {
    return menuItemPadding == null;
  }
}
