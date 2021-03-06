import 'package:cows_bulls_game/consts/app_consts.dart';
import 'package:cows_bulls_game/single_player_game/consts/single_game_screen_colors.dart';
import 'package:flutter/material.dart';

const keyboardDecorationRadius = 12.0;
const dialogDecorationRadius = 20.0;
const dialogButtonsRadius = 10.0;

const dialogDecoration = BoxDecoration(
  color: dialogBackColor,
  borderRadius: BorderRadius.all(
    Radius.circular(dialogDecorationRadius)    
  )
);

const keyboardDecoration = BoxDecoration(
  color: keyboardBackColor,
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(keyboardDecorationRadius),
    topLeft: Radius.circular(keyboardDecorationRadius)
  )
);

const BoxDecoration dialogRedButtonDecoration = const BoxDecoration(      
  color: Colors.red,
  borderRadius: BorderRadius.all(
    const Radius.circular(dialogButtonsRadius)
  )
);

const BoxDecoration dialogGrayButtonDecoration = const BoxDecoration(      
  color: dialogGrayButtonColor,
  borderRadius: BorderRadius.all(
    const Radius.circular(dialogButtonsRadius)
  )
);

const dialogTitleTextStyle = TextStyle(
  fontFamily: AppConsts.FONT_FAMILY_NAME,
  fontSize: 24,
  fontWeight: FontWeight.w400,
  color: dialogTitleColor
);

const dialogButtonsTextStyle = TextStyle(
  fontFamily: AppConsts.FONT_FAMILY_NAME,
  fontSize: 24,
  fontWeight: FontWeight.w400,
  color: Colors.white
);

