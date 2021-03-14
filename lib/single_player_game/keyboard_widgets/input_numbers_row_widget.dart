import 'package:cows_bulls_game/mobX/single_player_game_store.dart';
import 'package:cows_bulls_game/model/digit_button_type_enum.dart';
import 'package:cows_bulls_game/model/user_input_mode_enum.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_button_widgets/digit_cell_widget.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_button_widgets/locked_digit_cell_widget.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_button_widgets/marked_digit_cell_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class InputNumbersRowWidget extends StatelessWidget {

  final List<String> rowLabels;

  InputNumbersRowWidget({ @required this.rowLabels });

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<SinglePlayerGameStore>(context, listen: false);
    return Container(
      color: Colors.yellow,
      child: Row(
        children: _buildRowElements(store)
      )
    );
  }

  List<Widget> _buildRowElements(SinglePlayerGameStore store) {    
    List<Widget> widgets = [];
    for (int i = 0; i < rowLabels.length; i++) {
      widgets.add(
        Observer(builder: (contextObserver) {
          int digit = int.parse(rowLabels[i]);
          bool marked = store.isDigitMarked(digit);
          bool locked = store.isDigitLocked(digit);
          UserInputModeEnum inputMode = store.inputMode.value;
          return Expanded(
            child: GestureDetector(
              onTap: (inputMode == UserInputModeEnum.usualInput && (marked || locked)) 
                ? null
                : () => store.digitButtonTap(digit),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildCellWidget(marked, locked, rowLabels[i])                  
              )
            )
          );
        })        
      );
    }
    return widgets;
  }

  Widget _buildCellWidget(bool marked, bool locked, String label) {
    if (marked) {
      return MarkedDigitCellWidget(label);
    } else if (locked) {
      return LockedDigitCellWidget(label);
    } else {
      return DigitCellWidget(label);
    }
  }
}