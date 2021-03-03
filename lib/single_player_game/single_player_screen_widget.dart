import 'package:cows_bulls_game/consts/app_consts.dart';
import 'package:cows_bulls_game/single_player_game/main_game_ui_widget.dart';
import 'package:flutter/material.dart';

class SinglePlayerScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(            
            children: [
              Text(AppConsts.APP_NAME),  
              MainGameUIWidget()
            ]
          ),
        ),
      ),
    );
  }
}