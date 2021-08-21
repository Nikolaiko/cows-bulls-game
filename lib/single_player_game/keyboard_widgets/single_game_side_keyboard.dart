import 'package:cows_bulls_game/mobX/single_player_game_store.dart';
import 'package:cows_bulls_game/ui/common/keyboard_side_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SingleGameSideKeyboard extends StatelessWidget {
  const SingleGameSideKeyboard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<SinglePlayerGameStore>(context, listen: false);
    return Observer(
      builder: (BuildContext context) {
        return KeyboardSideWidget(
          store.isInputValid,
          store.makeTurn,
          store.backspace,
          store.switchInputMode,
          store.inputMode.value
        );
      }
    );
  }
}