import 'package:cows_bulls_game/consts/app_consts.dart';
import 'package:cows_bulls_game/ui/main_screen/consts/main_screen_colors.dart';
import 'package:flutter/material.dart';

const TextStyle playButtonTextStyle = TextStyle(
  fontFamily: AppConsts.FONT_FAMILY_NAME,
  color: playButtonTextColor,
  fontSize: 24.0,
  fontWeight: FontWeight.w400
);

const BoxDecoration playButtonDecoration = const BoxDecoration(      
  color: playButtonBackColor,
  borderRadius: BorderRadius.all(
    const Radius.circular(10.0)
  )
);

const TextStyle rulesButtonTextStyle = TextStyle(
  fontFamily: AppConsts.FONT_FAMILY_NAME,
  color: rulesButtonTextColor,
  fontSize: 24.0,
  fontWeight: FontWeight.w400
);

const BoxDecoration rulesButtonDecoration = const BoxDecoration(      
  color: rulesButtonBackColor,
  borderRadius: BorderRadius.all(
    const Radius.circular(10.0)
  )
);