import 'package:cows_bulls_game/consts/app_consts.dart';
import 'package:cows_bulls_game/ui/instructions_screen/const/instructions_consts.dart';
import 'package:flutter/material.dart';

const closeButtonsTextStyle = TextStyle(
  fontFamily: AppConsts.FONT_FAMILY_NAME,
  fontSize: 20,
  fontWeight: FontWeight.w400,
  color: Colors.white
);

const BoxDecoration closeButtonDecoration = const BoxDecoration(      
  color: Colors.red,
  borderRadius: BorderRadius.all(
    const Radius.circular(BORDER_CORNER_RADIUS)
  )
);