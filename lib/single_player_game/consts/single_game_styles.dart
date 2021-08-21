import 'package:cows_bulls_game/consts/app_consts.dart';
import 'package:cows_bulls_game/consts/common_ui_consts/common_ui_styles.dart';
import 'package:cows_bulls_game/single_player_game/consts/single_game_screen_colors.dart';
import 'package:flutter/material.dart';

const dialogDecoration = BoxDecoration(
  color: dialogBackColor,
  borderRadius: BorderRadius.all(
    Radius.circular(dialogDecorationRadius)    
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

