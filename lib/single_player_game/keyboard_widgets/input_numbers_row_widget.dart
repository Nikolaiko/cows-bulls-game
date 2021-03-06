import 'package:cows_bulls_game/mobX/single_player_game_store.dart';
import 'package:cows_bulls_game/model/digit_button_type_enum.dart';
import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/model/user_input_mode_enum.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_consts.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_button_widgets/input_digit_widgets/digit_cell_widget.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_button_widgets/input_digit_widgets/locked_digit_cell_widget.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_button_widgets/input_digit_widgets/marked_digit_cell_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class InputNumbersRowWidget extends StatelessWidget {

  final List<String> rowLabels;

  const InputNumbersRowWidget({ @required this.rowLabels });

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<SinglePlayerGameStore>(context, listen: false);
    var dimensions = ScreenDimensions(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildRowElements(store, dimensions)
    );
  }

  List<Widget> _buildRowElements(SinglePlayerGameStore store, ScreenDimensions dimensions) {    
    List<Widget> widgets = [];
    for (int i = 0; i < rowLabels.length; i++) {
      widgets.add(
        Observer(builder: (contextObserver) {
          int digit = int.parse(rowLabels[i]);
          bool marked = store.isDigitMarked(digit);
          bool locked = store.isDigitLocked(digit);
          UserInputModeEnum inputMode = store.inputMode.value;
          return GestureDetector(
            onTap: (inputMode == UserInputModeEnum.usualInput && (marked || locked)) 
              ? null
              : () => store.digitButtonTap(digit),
            child: Padding(
              padding: (i == rowLabels.length - 1) 
                ? EdgeInsets.zero
                : EdgeInsets.only(right: dimensions.width * enterDigitRowSpaceCoeff),
              child: _buildCellWidget(marked, locked, rowLabels[i], dimensions)                  
            )
          );
        })        
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