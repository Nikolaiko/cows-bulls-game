import 'package:cows_bulls_game/consts/app_consts.dart';
import 'package:cows_bulls_game/ui/common/keyboard/consts/keyboard_colors.dart';
import 'package:cows_bulls_game/ui/common/keyboard/consts/keyboard_consts.dart';
import 'package:flutter/material.dart';

const enterButtonsTextStyle = TextStyle(
    fontFamily: AppConsts.FONT_FAMILY_NAME,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.white);

ButtonStyle enterButtonStyle = ElevatedButton.styleFrom(
    primary: Colors.red, onPrimary: Colors.white, padding: EdgeInsets.zero);

const keyboardDecoration = BoxDecoration(
    color: keyboardBackColor,
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(keyboardDecorationRadius),
        topLeft: Radius.circular(keyboardDecorationRadius)));
