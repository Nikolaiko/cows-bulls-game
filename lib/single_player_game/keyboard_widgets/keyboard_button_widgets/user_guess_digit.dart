import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_consts.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_decoration_consts.dart';
import 'package:flutter/material.dart';

class UserGuessDigit extends StatelessWidget {
  final String _buttonText;
  final double _side;
  final bool _active;

  UserGuessDigit(
    this._buttonText, 
    this._active,
    dimensions
  ) : _side = dimensions.withoutSafeAreaHeight * 0.05;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _active
        ? selectedButtonDecoration
        : unselectedButtonDecoration,
      child: SizedBox(
        height: _side,
        width: _side,
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