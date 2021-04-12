import 'package:cows_bulls_game/consts/app_consts.dart';
import 'package:flutter/material.dart';

const enterButtonsTextStyle = TextStyle(
  fontFamily: AppConsts.FONT_FAMILY_NAME,
  fontSize: 20,
  fontWeight: FontWeight.w400,
  color: Colors.white
);

ButtonStyle enterButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.red,
  onPrimary: Colors.white,
  padding: EdgeInsets.zero
);