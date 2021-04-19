import 'package:cows_bulls_game/single_player_game/consts/single_game_styles.dart';
import 'package:cows_bulls_game/single_player_game/dialogs/alert_dialog.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_widget.dart';
import 'package:cows_bulls_game/single_player_game/turns_history_widgets/turns_history_list.dart';
import 'package:flutter/material.dart';

class GameUIWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {       
    return Expanded(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 2,
                child: TurnsHistoryList()
              ),
              Expanded(
                flex: 1,
                child: Container(              
                  child: KeyboardWidget(),              
                  decoration: keyboardDecoration
                )            
              )
            ],
          ),
          //_buildDialog()
        ],
      ),
    );
  }

  Widget _buildDialog() {
    return GameAlertDialog(title: "Title", content: "Cont");
  }
}