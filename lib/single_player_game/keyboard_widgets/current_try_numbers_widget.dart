import 'package:cows_bulls_game/mobX/single_player_game_store.dart';
import 'package:cows_bulls_game/model/digit_button_type_enum.dart';
import 'package:cows_bulls_game/model/user_input_cell_data.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_button_widgets/digit_cell_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CurrentTryNumbersWidget extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (observerContext) {  
        var store = Provider.of<SinglePlayerGameStore>(context);                  
        return Container(
          color: Colors.blue,
          child: Row(
            children: _buildRowElements(store)
          )
        );
      }          
    );
  }

  List<Widget> _buildRowElements(SinglePlayerGameStore store) {    
    List<UserInputCellData> currentTryValues = store.currentUserInput;
    int selectedIndex = store.currentUserInputIndex.value;
    List<Widget> widgets = [];
    for (int i = 0; i < currentTryValues.length; i++) {
      widgets.add(
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (currentTryValues[i].type == DigitButtonTypeEnum.usual)
                      ? () => store.selectDigitCell(i)
                      : null,
                    child: DigitCellWidget(
                      currentTryValues[i].value, 
                      selected: selectedIndex == i
                    ),
                  ),
                ),
                Opacity(
                  opacity: currentTryValues[i].value == " "
                    ? 0.0
                    : 1.0,
                    child: GestureDetector(
                      onTap: () => store.toggleLockState(i),
                      child: Icon(
                        (currentTryValues[i].type == DigitButtonTypeEnum.usual)
                          ? Icons.lock_open
                          : Icons.lock,
                      color: Colors.black,
                      size: 24.0,
                    ),
                  ),
                ) 
              ]
            )
          ),
        )
      );
    }
    return widgets;
  }
}