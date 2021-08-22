import 'dart:async';

import 'package:cows_bulls_game/mobX/pve_game_store.dart';
import 'package:cows_bulls_game/model/game_turn.dart';
import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/ui/common/turn_history_widgets/turn_record_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AITurnHistoryWidget extends StatelessWidget {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<PveGameStore>(context, listen: false);
    var dimensions = ScreenDimensions(context);
    return Container(
      decoration: BoxDecoration(                
        color: Colors.white,                
      ),
      child: Observer(
        builder: (observerContext) {          
          Timer(Duration(milliseconds: 100), () {
            _controller.jumpTo(_controller.position.maxScrollExtent);
          });

          Widget historyList = _buildList(store.aiTurnHistory);
          Widget progressBar = _buildProgressLoader(dimensions);

          return store.computerThinking.value
            ? Stack(children: [historyList, progressBar])
            : historyList;
        }
      )
    );
  }

  Widget _buildList(List<GameTurn> turns) {
    print(turns);
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

  Widget _buildProgressLoader(ScreenDimensions dimensions) {
    return Container(      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: dimensions.width / 6,
                height: dimensions.width / 6,
                child: CircularProgressIndicator(
                  strokeWidth: dimensions.width / 40,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}