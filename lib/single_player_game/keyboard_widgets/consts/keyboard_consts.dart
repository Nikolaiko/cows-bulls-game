import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_colors.dart';
import 'package:flutter/material.dart';

const double BORDER_CORNER_RADIUS = 6.0;
const double BORDER_WIDTH = 2.0;

const double currentTryContainerCoff = 0.01;    
const double currentTryDigitCellCoff = 0.05;  
const double currentTryDigitSpacingCoff = 0.04;

const double BUTTON_TEXT_SIZE = 25.0;

const TextStyle BUTTON_TEXT_STYLE = TextStyle(
  color: DIGIT_COLOR,
  fontSize: BUTTON_TEXT_SIZE
);

const TextStyle ENTER_BUTTON_TEXT_STYLE = TextStyle(
  color: ENTER_BUTTON_TEXT_COLOR,
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