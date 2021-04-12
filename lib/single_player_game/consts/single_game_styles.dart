import 'package:cows_bulls_game/single_player_game/consts/single_game_screen_colors.dart';
import 'package:flutter/material.dart';

const keyboardDecorationRadius = 6.0;


const keyboardDecoration = BoxDecoration(
  color: keyboardBackColor,
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(keyboardDecorationRadius),
    topLeft: Radius.circular(keyboardDecorationRadius)
  )
);