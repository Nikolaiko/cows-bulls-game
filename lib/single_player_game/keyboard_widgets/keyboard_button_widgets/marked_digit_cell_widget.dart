import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_consts.dart';
import 'package:flutter/material.dart';

class MarkedDigitCellWidget extends StatelessWidget {
  final String _buttonText;
  final bool selected;

  MarkedDigitCellWidget(this._buttonText, { this.selected = false });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: selected 
        ? KeyboardConsts.selectedButtonDecoration
        : KeyboardConsts.unselectedButtonDecoration,
      child: SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            _buttonText, 
            style: KeyboardConsts.MARKED_BUTTON_TEXT_STYLE
          )
        ),
      ),
    );
  }
}