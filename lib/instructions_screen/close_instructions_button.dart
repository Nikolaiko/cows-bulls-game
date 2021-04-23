import 'package:cows_bulls_game/instructions_screen/const/instructions_consts.dart';
import 'package:cows_bulls_game/instructions_screen/const/instructions_styles.dart';
import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:flutter/material.dart';

class CloseInstructionsButton extends StatelessWidget {
  final String _buttonText;
  final ScreenDimensions _dimensions;

  CloseInstructionsButton(
    this._buttonText,     
    this._dimensions
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: closeButtonDecoration,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _dimensions.width * closeButtonsHorPaddingCoef,
          vertical: _dimensions.fullHeight * closeButtonsVertPaddingCoef,
        ),
        child: SizedBox(
          height: _dimensions.withoutSafeAreaHeight * closeButtonSideCoef,          
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