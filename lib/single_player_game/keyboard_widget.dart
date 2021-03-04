import 'package:cows_bulls_game/single_player_game/keyboard_main_part.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_side_part.dart';
import 'package:flutter/material.dart';

class KeyboardWidget extends StatefulWidget {
  @override
  _KeyboardWidgetState createState() => _KeyboardWidgetState();
}

class _KeyboardWidgetState extends State<KeyboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 6, 
          child: KeyboardMainPart()
        ),
        Flexible(
          flex: 2, 
          child: KeyboardSideWidget()
        )
      ]
    );
  }
}