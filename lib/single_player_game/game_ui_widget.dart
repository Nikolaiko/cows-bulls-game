import 'package:cows_bulls_game/mobX/single_player_game_store.dart';
import 'package:cows_bulls_game/single_player_game/consts/single_game_styles.dart';
import 'package:cows_bulls_game/single_player_game/dialogs/alert_dialog.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_widget.dart';
import 'package:cows_bulls_game/single_player_game/turns_history_widgets/turns_history_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class GameUIWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {   
    var store = Provider.of<SinglePlayerGameStore>(context, listen: false);    
    return Expanded(
      child: Observer(
        builder: (contextObserver) {
          List<Widget> widgets = List.empty(growable: true);
          widgets.add(_buildMainGameScreen());
          if (store.gameCompleted.value) {
            widgets.add(GameAlertDialog(
            () => Navigator.of(context).pop(),
            () => store.resetGame()
          ));
          }
          return Stack(
        children: widgets
      );
        }
      )
    );
  }

  Widget _buildMainGameScreen() {
    return Column(
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
      ]
    );
  }
}