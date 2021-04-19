import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_consts.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/current_try_numbers_widget.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/input_numbers_row_widget.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_button_widgets/side_button_widgets/icon_side_button_widget.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_button_widgets/side_button_widgets/text_side_button_widget.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_main_part.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_side_part.dart';
import 'package:flutter/material.dart';

class KeyboardWidget extends StatefulWidget {
  @override
  _KeyboardWidgetState createState() => _KeyboardWidgetState();
}

class _KeyboardWidgetState extends State<KeyboardWidget> {  
  @override
  Widget build(BuildContext context) { 
    var dimensions = ScreenDimensions(context);   
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                    children: [
                      Flexible(
                        flex: 6, 
                        child: KeyboardMainPart()
                      ),
                      Flexible(
                        flex: 2, 
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: dimensions.width * 0.05
                          ),
                          child: KeyboardSideWidget(),
                        )
                      )
                    ]
                  ),
              )
            ]
          )
        )        
      ]
    );
  }
}


/*
Row(
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
                ),
*/