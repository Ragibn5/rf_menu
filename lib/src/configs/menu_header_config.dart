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

  MenuHeaderConfig copyWith({
    String? menuTitle,
    String? menuIconPath,
    IconData? menuIconData,
    EdgeInsets? separatorPadding,
  }) {
    return MenuHeaderConfig(
      menuTitle: menuTitle ?? this.menuTitle,
      menuIconPath: menuIconPath ?? this.menuIconPath,
      menuIconData: menuIconData ?? this.menuIconData,
      separatorPadding: separatorPadding ?? this.separatorPadding,
    );
  }
}
