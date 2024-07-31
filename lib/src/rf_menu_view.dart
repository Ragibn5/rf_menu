import 'package:flutter/material.dart';
import 'package:rf_menu/rf_menu.dart';
import 'package:rf_menu/src/click_feedback_container.dart';

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
      padding: EdgeInsets.zero,
      itemCount: _menuData.menuItems.length + 1,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        if (index == 0) return const SizedBox.shrink();
        return separatorBuilder(
          index - 1,
          _menuData.menuItems.length,
          _menuData.menuItems[index - 1],
        );
      },
      itemBuilder: (context, index) {
        if (index == 0) return menuHeaderBuilder();
        return ClickFeedbackContainer(
          child: menuItemBuilder(
            index - 1,
            _menuData.menuItems.length,
            _menuData.menuItems[index - 1],
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
  Widget menuHeaderBuilder();

  /// ### Build menu item widget.
  /// You should not wrap the returning widget with any user event
  /// detector like [InkWell] or [GestureDetector]. You just provide
  /// the UI that the user will look at and the library will handle the
  /// click/tap event capturing for you.
  /// Otherwise, unexpected things can happen.
  /// <br><br>
  /// [menuData.topPaddingExtension] & [menuData.bottomPaddingExtension] can
  /// be used to put extra space on the top-most and bottom-most menu item, or
  /// anything you like.
  Widget menuItemBuilder(
    int index,
    int hostMenuSize,
    RfMenuItemData itemData,
  );

  /// ### Build menu item separator widget.
  ///
  Widget separatorBuilder(
    int index,
    int hostMenuSize,
    RfMenuItemData itemData,
  );

  /// Specify what to do on when the menu item (the one with the [itemData])
  /// is clicked/tapped. This does not automatically handle popping of the
  /// current menu view. You need to do that yourself.
  /// <br><br>
  /// Note, the overrides of this method may handle auto popping.
  /// For example, the override within the [RfMenu] class handles auto popping.
  void onItemTap(BuildContext context, RfMenuItemData itemData);

  /// ### The data of the current menu or submenu.
  RfMenuData get menuData => _menuData;
}
