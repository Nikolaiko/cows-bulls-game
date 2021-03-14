import 'package:flutter/material.dart';

class KeyboardConsts {
  static const Color BOX_DECORATION_UNSELECTED_COLOR = Colors.grey;
  static const Color BOX_DECORATION_SELECTED_COLOR = Colors.white;
  static const Color BOX_DECORATION_BORDER_COLOR = Colors.black;

  static const double BORDER_CORNER_RADIUS = 6.0;
  static const double BORDER_WIDTH = 3.0;
  
  static const BorderRadius BORDER_RADIUS = const BorderRadius.all(
    const Radius.circular(BORDER_CORNER_RADIUS)
  );


  static BoxDecoration unselectedButtonDecoration = BoxDecoration(
    color: BOX_DECORATION_UNSELECTED_COLOR,
    borderRadius: BORDER_RADIUS,
    border: Border.all(
      color: BOX_DECORATION_BORDER_COLOR,
      width: BORDER_WIDTH,
    )
  );

  static BoxDecoration selectedButtonDecoration = BoxDecoration(
    color: BOX_DECORATION_SELECTED_COLOR,
    borderRadius: BORDER_RADIUS,
    border: Border.all(
      color: BOX_DECORATION_BORDER_COLOR,
      width: BORDER_WIDTH,
    )
  );


  static const double BUTTON_TEXT_SIZE = 25.0;
  static const Color MARKED_DIGIT_COLOR = Colors.red;
  static const Color DIGIT_COLOR = Colors.black;
  static const TextStyle BUTTON_TEXT_STYLE = TextStyle(
    color: DIGIT_COLOR,
    fontSize: BUTTON_TEXT_SIZE
  );

  static const TextStyle MARKED_BUTTON_TEXT_STYLE = TextStyle(
    color: MARKED_DIGIT_COLOR,
    fontSize: BUTTON_TEXT_SIZE
  );
  
}