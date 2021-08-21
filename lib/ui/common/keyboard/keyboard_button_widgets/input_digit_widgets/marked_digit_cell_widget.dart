import 'package:cows_bulls_game/ui/common/keyboard/consts/keyboard_consts.dart';
import 'package:cows_bulls_game/ui/common/keyboard/consts/keyboard_decoration_consts.dart';
import 'package:flutter/material.dart';

class MarkedDigitCellWidget extends StatelessWidget {
  final String _buttonText;
  final double _side;

  MarkedDigitCellWidget(this._buttonText, dimensions)
      : _side = dimensions.withoutSafeAreaHeight * enterDigitSideCoeff;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: usualNumberDecoration,
      child: SizedBox(
        height: _side,
        width: _side,
        child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(_buttonText, style: MARKED_BUTTON_TEXT_STYLE)),
      ),
    );
  }
}
