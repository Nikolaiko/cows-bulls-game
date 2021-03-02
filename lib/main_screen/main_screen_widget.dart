import 'package:cows_bulls_game/consts/app_consts.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(AppConsts.APP_NAME),
          RaisedButton(
            child: Text("Single player game"),
            onPressed: _startSinglePlayerGame
          )
        ]
      ),
    );
  }

  void _startSinglePlayerGame() {
    
  }
}