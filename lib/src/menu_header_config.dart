import 'package:flutter/widgets.dart';
import 'package:rf_menu/src/passthrough_contract.dart';

class MenuHeaderConfig implements PassthroughContract {
  final String menuTitle;
  final String? menuIconPath;
  final IconData? menuIconData;

  MenuHeaderConfig({
    required this.menuTitle,
    this.menuIconPath,
    this.menuIconData,
  });

  @override
  bool isPassthrough(){
    return menuTitle.isEmpty && menuIconPath == null && menuIconData == null;
  }
}
