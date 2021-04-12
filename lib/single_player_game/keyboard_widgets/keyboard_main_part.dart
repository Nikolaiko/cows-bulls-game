import 'package:cows_bulls_game/single_player_game/keyboard_widgets/current_try_numbers_widget.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/input_numbers_row_widget.dart';
import 'package:flutter/material.dart';

class KeyboardMainPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        CurrentTryNumbersWidget(),
        Expanded(
          flex: 1,
          child: InputNumbersRowWidget(
            rowLabels: ["1", "2", "3", "4", "5"]            
          )
        ),
        Expanded(
          flex: 1,
          child: InputNumbersRowWidget(
            rowLabels: ["6", "7", "8", "9", "0"]
          )        
        )
      ]
    );
  }
}