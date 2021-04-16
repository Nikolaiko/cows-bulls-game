import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_consts.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_decoration_consts.dart';
import 'package:flutter/material.dart';


class DigitCellWidget extends StatelessWidget {
  final String _buttonText;
  final double _side;  

  DigitCellWidget(
    this._buttonText,     
    dimensions
  ) : _side = dimensions.withoutSafeAreaHeight * currentTryDigitCellCoff;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: usualNumberDecoration,
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