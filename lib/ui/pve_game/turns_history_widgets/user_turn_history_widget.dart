import 'dart:async';

import 'package:cows_bulls_game/consts/app_consts.dart';
import 'package:cows_bulls_game/mobX/pve_game_store.dart';
import 'package:cows_bulls_game/model/game_turn.dart';
import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/ui/common/turn_history_widgets/turn_record_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class UserTurnsHistoryWidget extends StatelessWidget {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var dimensions = ScreenDimensions(context);
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
          return _buildList(store.userTurnHistory, dimensions);
        }
      )
    );
  }

  Widget _buildList(List<GameTurn> turns, ScreenDimensions dimensions) {
    return ListView.builder(  
      controller: _controller,                  
      itemCount: turns.length + 1,
      itemBuilder: (context, i) {
        return i == 0
          ? _buildListTitle(dimensions)
          : _buildRow(turns[i - 1], i - 1);        
      }
    );
  }

  Widget _buildRow(GameTurn turn, int index) {
    String historyText = "";
    turn.turnValues.forEach((element) { historyText += "$element"; });
    return TurnRecordWidget(index, historyText, turn.cows, turn.bulls);
  }

  Widget _buildListTitle(ScreenDimensions dimensions) {
    return Padding(
      padding: EdgeInsets.only(
        top: dimensions.withoutSafeAreaHeight * 0.01
      ),
      child: Text(
        "Твои ходы",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: AppConsts.FONT_FAMILY_NAME,
          fontSize: 20,
          fontWeight: FontWeight.w400
        )
      ),
    );
  }
}