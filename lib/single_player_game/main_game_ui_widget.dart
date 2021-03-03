import 'package:cows_bulls_game/single_player_game/keyboard_widget.dart';
import 'package:flutter/material.dart';

class MainGameUIWidget extends StatelessWidget {
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
                color: Colors.red
              )
            ),
          ),
          Expanded(
            flex: 1,
            child: KeyboardWidget(),            
          )
        ],
      ),
    );
  }
}