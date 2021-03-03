import 'package:cows_bulls_game/consts/app_consts.dart';
import 'package:cows_bulls_game/single_player_game/single_player_screen_widget.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(AppConsts.APP_NAME),
              RaisedButton(
                child: Text("Single player game"),
                onPressed: () { _startSinglePlayerGame(context); }
              )
            ]
          ),
        ),
      ),
    );
  }

  void _startSinglePlayerGame(BuildContext context) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (routeContext) {
          return SinglePlayerScreenWidget();
        }
      )
    );
  }
}