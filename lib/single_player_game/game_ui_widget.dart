import 'package:cows_bulls_game/mobX/single_player_game_store.dart';
import 'package:cows_bulls_game/model/game_turn.dart';
import 'package:cows_bulls_game/single_player_game/consts/single_game_styles.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class GameUIWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(const Radius.circular(6.0)), 
                color: Colors.red,                
              ),
              child: Observer(
                builder: (observerContext) {
                  var store = Provider.of<SinglePlayerGameStore>(context);
                  List<GameTurn> turns = store.turnHistory;

                  String historyText = "";
                  for (var item in turns) {
                    historyText += "${item.turnValues}. C:${item.cows}. B:${item.bulls} \n";
                  }
                  return Text(historyText);
                }
              ),
            ),
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
    );
  }
}