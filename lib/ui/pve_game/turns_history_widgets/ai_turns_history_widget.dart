import 'dart:async';

import 'package:cows_bulls_game/consts/app_consts.dart';
import 'package:cows_bulls_game/mobX/pve_game_store.dart';
import 'package:cows_bulls_game/model/game_side_enum.dart';
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

          Widget historyList = _buildList(store, dimensions);
          Widget progressBar = _buildProgressLoader(dimensions);

          return store.computerThinking.value
            ? Stack(children: [historyList, progressBar])
            : historyList;
        }
      )
    );
  }

  Widget _buildList(PveGameStore store, ScreenDimensions dimensions) {
    return ListView.builder(  
      controller: _controller,                  
      itemCount: store.aiTurnHistory.length + 1,
      itemBuilder: (context, i) {
        return i == 0
          ? _buildListTitle(dimensions)
          : _buildRow(
            store.aiTurnHistory[i - 1], 
            i - 1,
            store.gameWinner.value == GameSide.none
          );
      }
    );
  }

  Widget _buildRow(GameTurn turn, int index, bool hidden) {
    String historyText = "";
    turn.turnValues.forEach((element) { 
      historyText += hidden 
        ? "*"
        : element.toString(); 
    });
    return TurnRecordWidget(index, historyText, turn.cows, turn.bulls);
  }

  Widget _buildListTitle(ScreenDimensions dimensions) {
    return Padding(
      padding: EdgeInsets.only(        
        top: dimensions.withoutSafeAreaHeight * 0.01      
      ),
      child: Text(
        "Ходы противника",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: AppConsts.FONT_FAMILY_NAME,
          fontSize: 20,
          fontWeight: FontWeight.w400
        )
      ),
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