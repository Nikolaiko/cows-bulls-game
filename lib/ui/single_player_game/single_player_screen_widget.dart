import 'package:cows_bulls_game/consts/app_consts.dart';
import 'package:cows_bulls_game/ui/single_player_game/game_ui_widget.dart';
import 'package:flutter/material.dart';

class SinglePlayerScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppConsts.APP_NAME)),
      body: SafeArea(
        child: Container(
          child: Column(            
            children: [              
              GameUIWidget()
            ]
          ),
        ),
      ),
    );
  }
}