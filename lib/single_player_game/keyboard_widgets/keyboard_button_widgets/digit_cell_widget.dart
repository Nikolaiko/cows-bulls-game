import 'package:flutter/material.dart';

import '../keyboard_consts.dart';

class DigitCellWidget extends StatelessWidget {
  final String _buttonText;
  final bool selected;

  DigitCellWidget(this._buttonText, { this.selected = false });

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
            style: KeyboardConsts.BUTTON_TEXT_STYLE
          )
        ),
      ),
    );
  }
}