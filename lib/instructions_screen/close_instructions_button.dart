import 'package:cows_bulls_game/instructions_screen/const/instructions_consts.dart';
import 'package:cows_bulls_game/instructions_screen/const/instructions_styles.dart';
import 'package:flutter/material.dart';

class CloseInstructionsButton extends StatelessWidget {
  final String _buttonText;
  final double _height;

  CloseInstructionsButton(
    this._buttonText,     
    dimensions
  ) : _height = dimensions.withoutSafeAreaHeight * closeButtonSideCoef;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: closeButtonDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          height: _height,          
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              _buttonText, 
              style: closeButtonsTextStyle
            ),
          ),
        ),
      ),
    );
  }
}