import 'package:flutter/widgets.dart';
import 'package:rf_menu/src/contracts/passthrough_contract.dart';

class MenuHeaderConfig implements PassthroughContract {
  final String menuTitle;
  final String? menuIconPath;
  final IconData? menuIconData;
  final EdgeInsets? separatorPadding;

  MenuHeaderConfig({
    required this.menuTitle,
    this.menuIconPath,
    this.menuIconData,
    this.separatorPadding,
  });

  @override
  bool isPassthrough() {
    return menuTitle.isEmpty &&
        menuIconPath == null &&
        menuIconData == null &&
        separatorPadding == null;
  }
}
