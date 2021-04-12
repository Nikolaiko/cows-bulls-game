import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_consts.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_decoration_consts.dart';
import 'package:flutter/material.dart';

class KeyboardSideButtonWidget extends StatelessWidget {
  final String _buttonText;

  KeyboardSideButtonWidget(this._buttonText);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: unselectedButtonDecoration,
      child: SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            _buttonText, 
            style: BUTTON_TEXT_STYLE
          )
        ),
      ),
    );
  }
}