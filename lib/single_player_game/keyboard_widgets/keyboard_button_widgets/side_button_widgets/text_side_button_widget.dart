import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_consts.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_decoration_consts.dart';
import 'package:flutter/material.dart';

class TextSideButtonWidget extends StatelessWidget {
  final String _buttonText;
  final double _side;  

  TextSideButtonWidget(
    this._buttonText,     
    dimensions
  ) : _side = dimensions.withoutSafeAreaHeight * currentTryDigitCellCoff;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: enterButtonDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          height: _side,        
          child: Text(
            _buttonText, 
            style: ENTER_BUTTON_TEXT_STYLE
          ),
        ),
      ),
    );
  }
}