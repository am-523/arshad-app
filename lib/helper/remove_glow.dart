import 'package:flutter/cupertino.dart';

class RemoveGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    // return super.buildViewportChrome(context, child, axisDirection);
    return child;
  }
}
