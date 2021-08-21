import 'package:cows_bulls_game/model/callback_types.dart';
import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/model/user_input_mode_enum.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_consts.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_button_widgets/input_digit_widgets/digit_cell_widget.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_button_widgets/input_digit_widgets/locked_digit_cell_widget.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_button_widgets/input_digit_widgets/marked_digit_cell_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class InputNumbersRowWidget extends StatelessWidget {

  final List<String> rowLabels;
  final CheckDigitStateFunction _isDigitMarked;
  final CheckDigitStateFunction _isDigitLocked;
  final InputDigitFunction _inputDigit;
  final UserInputModeEnum _inputMode;

  const InputNumbersRowWidget(
    this.rowLabels,
    this._isDigitMarked,
    this._isDigitLocked,
    this._inputDigit,
    this._inputMode
  );

  @override
  Widget build(BuildContext context) {    
    var dimensions = ScreenDimensions(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildRowElements(dimensions)
    );
  }

  List<Widget> _buildRowElements(ScreenDimensions dimensions) {    
    List<Widget> widgets = [];    
    for (int i = 0; i < rowLabels.length; i++) {      
      widgets.add(
        Observer(
          builder: (context) {
            int digit = int.parse(rowLabels[i]);
            bool marked = _isDigitMarked(digit);
            bool locked = _isDigitLocked(digit); 
            return GestureDetector(
              onTap: (_inputMode == UserInputModeEnum.usualInput && (marked || locked)) 
                ? null
                : () => _inputDigit(digit),
              child: Padding(
                padding: (i == rowLabels.length - 1) 
                  ? EdgeInsets.zero
                  : EdgeInsets.only(right: dimensions.width * enterDigitRowSpaceCoeff),
                child: _buildCellWidget(marked, locked, rowLabels[i], dimensions)                  
              )
            );
          }
        )                
      );
    }
    return widgets;
  }

  Widget _buildCellWidget(bool marked, bool locked, String label, ScreenDimensions dimensions) {
    if (marked) {
      return MarkedDigitCellWidget(label, dimensions);
    } else if (locked) {
      return LockedDigitCellWidget(label, dimensions);
    } else {
      return DigitCellWidget(label, dimensions);
    }
  }
}