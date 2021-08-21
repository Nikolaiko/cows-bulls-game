import 'package:cows_bulls_game/consts/app_consts.dart';
import 'package:cows_bulls_game/ui/common/keyboard/consts/keyboard_colors.dart';
import 'package:flutter/material.dart';

const keyboardDecorationRadius = 12.0;
const dialogDecorationRadius = 20.0;
const dialogButtonsRadius = 10.0;

const double BORDER_CORNER_RADIUS = 6.0;
const double BORDER_WIDTH = 2.0;

const double currentTryContainerCoff = 0.01;
const double currentTryDigitCellCoff = 0.05;
const double currentTryDigitSpacingCoff = 0.04;

const double enterDigitRowSpaceCoeff = 0.01;
const double enterDigitBottomSpaceCoeff = 0.05;
const double enterDigitSideCoeff = 0.06;

const double enterButtonHeightCoff = 0.06;

const double BUTTON_TEXT_SIZE = 25.0;

const TextStyle BUTTON_TEXT_STYLE =
    TextStyle(color: DIGIT_COLOR, fontSize: BUTTON_TEXT_SIZE);

const TextStyle ENTER_BUTTON_TEXT_STYLE = TextStyle(
    fontFamily: AppConsts.FONT_FAMILY_NAME,
    color: ENTER_BUTTON_TEXT_COLOR,
    fontSize: BUTTON_TEXT_SIZE,
    fontWeight: FontWeight.w600);

const TextStyle MARKED_BUTTON_TEXT_STYLE =
    TextStyle(color: MARKED_DIGIT_COLOR, fontSize: BUTTON_TEXT_SIZE);

const TextStyle LOCKED_BUTTON_TEXT_STYLE =
    TextStyle(color: LOCKED_DIGIT_COLOR, fontSize: BUTTON_TEXT_SIZE);
