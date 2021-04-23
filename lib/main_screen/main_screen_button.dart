import 'package:cows_bulls_game/main_screen/consts/main_screen_consts.dart';
import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:flutter/material.dart';

class MainScreenButton extends StatelessWidget {
  final String _buttonText;
  final ScreenDimensions _dimensions;
  final BoxDecoration _decoration;
  final TextStyle _textStyle;

  MainScreenButton(
    this._buttonText,     
    this._dimensions,
    this._decoration,
    this._textStyle
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: _dimensions.width * mainButtonsHorPaddingCoef,
          vertical: _dimensions.fullHeight * mainButtonsVertPaddingCoef,
        ),
        child: SizedBox(
          height: _dimensions.withoutSafeAreaHeight * mainButtonsHeightCoef,          
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              _buttonText, 
              style: _textStyle
            ),
          ),
        ),
      ),
    );
  }
}