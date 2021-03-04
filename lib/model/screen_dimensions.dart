import 'package:flutter/material.dart';

class ScreenDimensions {
  double width;
  double fullHeight;
  double withoutSafeAreaHeight;

  ScreenDimensions(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    fullHeight = MediaQuery.of(context).size.height;

    var padding = MediaQuery.of(context).padding;
    withoutSafeAreaHeight = fullHeight - padding.top - padding.bottom;
  }
}