import 'package:flutter/widgets.dart';
import 'package:rf_menu/src/contracts/passthrough_contract.dart';

class MenuItemConfig implements PassthroughContract {
  final EdgeInsets? menuItemPadding;

  final double? topItemTopPaddingExtension;
  final double? bottomItemBottomPaddingExtension;

  MenuItemConfig({
    this.menuItemPadding,
    this.topItemTopPaddingExtension,
    this.bottomItemBottomPaddingExtension,
  });

  @override
  bool isPassthrough() {
    return menuItemPadding == null &&
        topItemTopPaddingExtension == null &&
        bottomItemBottomPaddingExtension == null;
  }

  MenuItemConfig copyWith({
    EdgeInsets? menuItemPadding,
    double? topItemTopPaddingExtension,
    double? bottomItemBottomPaddingExtension,
  }) {
    return MenuItemConfig(
      menuItemPadding: menuItemPadding ?? this.menuItemPadding,
      topItemTopPaddingExtension:
          topItemTopPaddingExtension ?? this.topItemTopPaddingExtension,
      bottomItemBottomPaddingExtension: bottomItemBottomPaddingExtension ??
          this.bottomItemBottomPaddingExtension,
    );
  }
}
