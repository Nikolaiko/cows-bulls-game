import 'package:cows_bulls_game/model/callback_types.dart';
import 'package:cows_bulls_game/model/digit_button_type_enum.dart';
import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/model/user_input_cell_data.dart';
import 'package:cows_bulls_game/ui/common/keyboard/consts/keyboard_consts.dart';
import 'package:cows_bulls_game/ui/common/keyboard/user_guess_widget/lockable_digit_widget.dart';
import 'package:flutter/material.dart';

class CurrentTryNumbersWidget extends StatelessWidget {
  final List<UserInputCellData> _currentTryValues;
  final int _selectedIndex;
  final InputDigitFunction _toggleLockState;
  final InputDigitFunction _selectDigitCell;

  CurrentTryNumbersWidget(this._currentTryValues, this._selectedIndex,
      this._toggleLockState, this._selectDigitCell);

  @override
  Widget build(BuildContext context) {
    var dimensions = ScreenDimensions(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildRowElements(dimensions));
  }

  List<Widget> _buildRowElements(ScreenDimensions dimensions) {
    List<Widget> widgets = [];
    for (int i = 0; i < _currentTryValues.length; i++) {
      widgets.add(Padding(
          padding: (i == _currentTryValues.length - 1)
              ? EdgeInsets.zero
              : _buildSideInsets(dimensions),
          child: LocableDigitWidget(
              _currentTryValues[i].value,
              _currentTryValues[i].type != DigitButtonTypeEnum.usual,
              _selectedIndex == i,
              () => _toggleLockState(i),
              (_currentTryValues[i].type == DigitButtonTypeEnum.usual)
                  ? () => _selectDigitCell(i)
                  : null)));
    }
    return widgets;
  }

  EdgeInsets _buildSideInsets(ScreenDimensions dimensions) {
    return EdgeInsets.only(
        right: dimensions.width * currentTryDigitSpacingCoff);
  }
}
