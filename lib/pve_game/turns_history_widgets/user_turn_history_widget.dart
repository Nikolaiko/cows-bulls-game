import 'dart:async';

import 'package:cows_bulls_game/mobX/pve_game_store.dart';
import 'package:cows_bulls_game/model/game_turn.dart';
import 'package:cows_bulls_game/ui/common/turn_history_widgets/turn_record_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class UserTurnsHistoryWidget extends StatelessWidget {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(                
        color: Colors.white,                
      ),
      child: Observer(
        builder: (observerContext) {
          var store = Provider.of<PveGameStore>(context);          
          Timer(Duration(milliseconds: 100), () {
            _controller.jumpTo(_controller.position.maxScrollExtent);
          });                             
          return _buildList(store.userTurnHistory);
        }
      )
    );
  }

  Widget _buildList(List<GameTurn> turns) {
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
}