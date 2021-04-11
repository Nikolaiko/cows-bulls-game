import 'package:cows_bulls_game/consts/app_consts.dart';
import 'package:flutter/material.dart';

const mainButtonsStyle = TextStyle(
  fontFamily: AppConsts.FONT_FAMILY_NAME,
  fontSize: 24,
  fontWeight: FontWeight.w400
);

ButtonStyle playButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.red,
  onPrimary: Colors.white
);

ButtonStyle rulesButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.transparent,
  onPrimary: Colors.grey
);