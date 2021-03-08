import 'package:cows_bulls_game/mobX/single_player_game_store.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_button_widgets/digit_cell_widget.dart';
import 'package:flutter/material.dart';
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
        Expanded(
          child: GestureDetector(
            onTap: () => store.setNumberForCurrentPlace(int.parse(rowLabels[i])),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DigitCellWidget(rowLabels[i])
            ),
          ),
        )
      );
    }
    return widgets;
  }
}