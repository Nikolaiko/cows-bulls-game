import 'package:cows_bulls_game/consts/common_ui_consts/common_ui_colors.dart';
import 'package:flutter/material.dart';

const keyboardDecorationRadius = 12.0;
const dialogDecorationRadius = 20.0;
const dialogButtonsRadius = 10.0;

const keyboardDecoration = BoxDecoration(
  color: keyboardBackColor,
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(keyboardDecorationRadius),
    topLeft: Radius.circular(keyboardDecorationRadius)
  )
);