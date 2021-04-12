import 'package:flutter/material.dart';

const Color BOX_DECORATION_UNSELECTED_COLOR = Colors.white;
const Color BOX_DECORATION_SELECTED_COLOR = Colors.white;
const Color BOX_DECORATION_BORDER_COLOR_SELECTED = Colors.black;
const Color BOX_DECORATION_BORDER_COLOR_UNSELECTED = Colors.white;

const double BORDER_CORNER_RADIUS = 6.0;
const double BORDER_WIDTH = 2.0;
  
const double currentTryDigitCellCoff = 0.05;  


   

   const double BUTTON_TEXT_SIZE = 25.0;
   const Color MARKED_DIGIT_COLOR = Colors.red;
   const Color LOCKED_DIGIT_COLOR = Colors.blue;
   const Color DIGIT_COLOR = Colors.black;
   const TextStyle BUTTON_TEXT_STYLE = TextStyle(
    color: DIGIT_COLOR,
    fontSize: BUTTON_TEXT_SIZE
  );

   const TextStyle MARKED_BUTTON_TEXT_STYLE = TextStyle(
    color: MARKED_DIGIT_COLOR,
    fontSize: BUTTON_TEXT_SIZE
  );
  
   const TextStyle LOCKED_BUTTON_TEXT_STYLE = TextStyle(
    color: LOCKED_DIGIT_COLOR,
    fontSize: BUTTON_TEXT_SIZE
  );