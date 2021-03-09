import 'package:cows_bulls_game/mobX/single_player_game_store.dart';
import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_button_widgets/keyboard_side_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KeyboardSideWidget extends StatelessWidget {
  static const double BETWEEN_BUTTONS_SPACE = 0.1;

  @override
  Widget build(BuildContext context) {
    var dimens = ScreenDimensions(context);
    var store = Provider.of<SinglePlayerGameStore>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: GestureDetector(
            onTap: () => store.makeTurn(),
            child: Padding(
              padding: EdgeInsets.all(dimens.width * 0.01),
              child: KeyboardSideButtonWidget(
                "Ввод"
              )
            ),
          )
        ),        
        Flexible(
          flex: 1,
          child: GestureDetector(
            onTap: () => store.backspace(),
            child: Padding(
              padding: EdgeInsets.all(dimens.width * 0.01),
              child: KeyboardSideButtonWidget(
                "Удалить"
              )
            ),
          )
        )        
      ] 
    );
  }
}  

    