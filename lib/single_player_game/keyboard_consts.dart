import 'package:flutter/material.dart';

class KeyboardConsts {
  static const Color BOX_DECORATION_COLOR = Colors.grey;
  static const double BORDER_CORNER_RADIUS = 6.0;
  
  static const BorderRadius BORDER_RADIUS = const BorderRadius.all(
    const Radius.circular(BORDER_CORNER_RADIUS)
  );


  static const BoxDecoration BUTTON_DECORATION = const BoxDecoration(
    color: BOX_DECORATION_COLOR,
    borderRadius: BORDER_RADIUS
  );


  static const double BUTTON_TEXT_SIZE = 25.0;
  static const TextStyle BUTTON_TEXT_STYLE = TextStyle(
    fontSize: BUTTON_TEXT_SIZE
  );
  
}