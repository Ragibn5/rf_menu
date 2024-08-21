import 'package:flutter/widgets.dart';
import 'package:rf_menu/src/contracts/passthrough_contract.dart';

class MenuBodyConfig implements PassthroughContract {
  final EdgeInsets? bodyPadding;

  MenuBodyConfig({this.bodyPadding});

  @override
  bool isPassthrough() {
    return bodyPadding == null;
  }
}
