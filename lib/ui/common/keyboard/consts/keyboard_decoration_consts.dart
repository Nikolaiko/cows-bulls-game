import 'package:cows_bulls_game/ui/common/keyboard/consts/keyboard_colors.dart';
import 'package:cows_bulls_game/ui/common/keyboard/consts/keyboard_consts.dart';
import 'package:flutter/material.dart';

const BorderRadius BORDER_RADIUS =
    const BorderRadius.all(const Radius.circular(BORDER_CORNER_RADIUS));

const BoxDecoration enterButtonDecoration = const BoxDecoration(
    color: Colors.red,
    borderRadius:
        BorderRadius.all(const Radius.circular(BORDER_CORNER_RADIUS)));

BoxDecoration usualNumberDecoration =
    BoxDecoration(color: usualNumberBackground, borderRadius: BORDER_RADIUS);

BoxDecoration unselectedButtonDecoration = BoxDecoration(
    color: BOX_DECORATION_UNSELECTED_COLOR,
    borderRadius: BORDER_RADIUS,
    border: Border.all(
      color: BOX_DECORATION_BORDER_COLOR_UNSELECTED,
      width: BORDER_WIDTH,
    ));

BoxDecoration selectedButtonDecoration = BoxDecoration(
    color: BOX_DECORATION_SELECTED_COLOR,
    borderRadius: BORDER_RADIUS,
    border: Border.all(
      color: BOX_DECORATION_BORDER_COLOR_SELECTED,
      width: BORDER_WIDTH,
    ));
