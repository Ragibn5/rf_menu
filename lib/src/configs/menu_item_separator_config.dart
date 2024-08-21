import 'package:flutter/widgets.dart';
import 'package:rf_menu/src/contracts/passthrough_contract.dart';

class MenuItemSeparatorConfig implements PassthroughContract {
  final EdgeInsets? menuItemSeparatorPadding;

  MenuItemSeparatorConfig({this.menuItemSeparatorPadding});

  @override
  bool isPassthrough() {
    return menuItemSeparatorPadding == null;
  }
}
