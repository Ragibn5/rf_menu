import 'package:flutter/material.dart';

class ClickFeedbackContainer extends StatelessWidget {
  final Widget _child;
  final Function()? _onTap;

  const ClickFeedbackContainer({
    super.key,
    required Widget child,
    required Function()? onTap,
  })  : _child = child,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(onTap: _onTap, child: _child),
    );
  }
}
