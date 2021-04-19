import 'dart:async';

import 'package:cows_bulls_game/mobX/single_player_game_store.dart';
import 'package:cows_bulls_game/model/game_turn.dart';
import 'package:cows_bulls_game/single_player_game/consts/single_game_styles.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_widget.dart';
import 'package:cows_bulls_game/single_player_game/turns_history_widgets/turn_record_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class GameUIWidget extends StatelessWidget {
  final ScrollController _controller = ScrollController();

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
                color: Colors.white,                
              ),
              child: Observer(
                builder: (observerContext) {
                  var store = Provider.of<SinglePlayerGameStore>(context);
                  List<GameTurn> turns = store.turnHistory;       
                  Timer(Duration(milliseconds: 100), () {
                    _controller.jumpTo(_controller.position.maxScrollExtent);
                  });                             
                  return ListView.builder(  
                    controller: _controller,                  
                    itemCount: turns.length,
                    itemBuilder: (context, i) { 
                      String historyText = "";
                      turns[i].turnValues.forEach((element) { historyText += "$element"; });
                      return TurnRecordWidget(i, historyText, turns[i].cows, turns[i].bulls);
                    }
                  );
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