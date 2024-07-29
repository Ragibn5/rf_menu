import 'package:rf_menu/src/passthrough_contract.dart';

class MenuBodyConfig implements PassthroughContract{
  final double? topPaddingExtension;
  final double? bottomPaddingExtension;

  MenuBodyConfig({this.topPaddingExtension, this.bottomPaddingExtension});

  @override
  bool isPassthrough() {
    return topPaddingExtension == null && bottomPaddingExtension == null;
  }
}
