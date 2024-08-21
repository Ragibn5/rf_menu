import 'package:flutter/material.dart';
import 'package:rf_menu/rf_menu.dart';
import 'package:rf_menu/src/ui/click_feedback_container.dart';

/// ### Extend this class to create a non-nested menu page.
/// Please note, this class is only intended to create non-nested menu page.
/// It supports menu item click event handling, however, it does not handle
/// auto popping, submenu routing etc. You need to handle it yourself if you
/// want to. Or, use the built-in [RfMenu] which handles these for you.
abstract class RfMenuView extends StatelessWidget {
  final RfMenuData _menuData;

  const RfMenuView({
    super.key,
    required RfMenuData menuData,
  }) : _menuData = menuData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: _menuData.menuBodyConfig?.bodyPadding ?? EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _menuData.menuItems.length + 1,
      separatorBuilder: (context, index) {
        if (index == 0) return const SizedBox.shrink();
        return separatorBuilder(
          index: index - 1,
          hostMenuSize: _menuData.menuItems.length,
          itemData: _menuData.menuItems[index - 1],
          separatorConfig: _menuData.menuItemSeparatorConfig,
        );
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          return menuHeaderBuilder(config: _menuData.menuHeaderConfig);
        }
        return ClickFeedbackContainer(
          child: menuItemBuilder(
            index: index - 1,
            hostMenuSize: _menuData.menuItems.length,
            itemData: _menuData.menuItems[index - 1],
            itemConfig: _menuData.menuItemConfig,
          ),
          onTap: () => onItemTap(
            context,
            _menuData.menuItems[index - 1],
          ),
        );
      },
    );
  }

  /// ### Build menu header widget.
  /// Header title and icon can be obtained from [menuData].
  /// <br><br>
  /// Note that you can provide the config (along with other configs) when
  /// defining the menu, and this method will deliver it to you, but you
  /// will have to use it yourself to make appropriate item UI, it is not
  /// applied automatically.
  Widget menuHeaderBuilder({MenuHeaderConfig? config});

  /// ### Build menu item widget.
  /// You should not wrap the returning widget with any user event
  /// detector like [InkWell] or [GestureDetector]. You just provide
  /// the UI that the user will look at and the library will handle the
  /// click/tap event capturing for you.
  /// Otherwise, unexpected things can happen.
  /// <br><br>
  /// Use MenuItemConfig to customize the appearance of the menu items.
  /// <br><br>
  /// Note that you can provide the config (along with other configs) when
  /// defining the menu, and this method will deliver it to you, but you
  /// will have to use it yourself to make appropriate item UI, it is not
  /// applied automatically.
  Widget menuItemBuilder({
    required int index,
    required int hostMenuSize,
    required RfMenuItemData itemData,
    MenuItemConfig? itemConfig,
  });

  /// ### Build menu item separator widget.
  /// Note that you can provide the config (along with other configs) when
  /// defining the menu, and this method will deliver it to you, but you
  /// will have to use it yourself to make appropriate separator UI, it is
  /// not applied automatically.
  Widget separatorBuilder({
    required int index,
    required int hostMenuSize,
    required RfMenuItemData itemData,
    MenuItemSeparatorConfig? separatorConfig,
  });

  /// Specify what to do on when the menu item (the one with the [itemData])
  /// is clicked/tapped. This does not automatically handle popping of the
  /// current menu view. You need to do that yourself.
  /// <br><br>
  /// Note, the overrides of this method may handle auto popping.
  /// For example, the override within the [RfMenu] class handles auto popping.
  void onItemTap(BuildContext context, RfMenuItemData itemData);
}
