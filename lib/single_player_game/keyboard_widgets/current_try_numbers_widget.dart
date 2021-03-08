import 'package:cows_bulls_game/mobX/single_player_game_store.dart';
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
            children: _buildRowElements(store.currentUserInput, store.currentUserInputIndex.value)
          )
        );
      }          
    );
  }

  List<Widget> _buildRowElements(List<String> currentTryValues, int selectedIndex) {    
    List<Widget> widgets = [];
    for (int i = 0; i < currentTryValues.length; i++) {
      widgets.add(
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DigitCellWidget(
              currentTryValues[i], 
              selected: selectedIndex == i
            )
          ),
        )
      );
    }
    return widgets;
  }
}