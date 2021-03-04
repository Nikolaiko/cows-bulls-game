import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_side_button_widget.dart';
import 'package:flutter/material.dart';

class KeyboardSideWidget extends StatelessWidget {
  static const double BETWEEN_BUTTONS_SPACE = 0.1;

  @override
  Widget build(BuildContext context) {
    ScreenDimensions dimens = ScreenDimensions(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(dimens.width * 0.01),
            child: KeyboardSideButtonWidget(
              "Ввод"
            )
          )
        ),        
        Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(dimens.width * 0.01),
            child: KeyboardSideButtonWidget(
              "Удалить"
            )
          )
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(dimens.width * 0.01),
            child: KeyboardSideButtonWidget(
              "Мод 1"
            )
          )
        )
      ] 
    );
  }
}  

    