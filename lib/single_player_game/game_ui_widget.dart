import 'package:cows_bulls_game/mobX/single_player_game_store.dart';
import 'package:cows_bulls_game/single_player_game/dialogs/alert_dialog.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/single_game_side_keyboard.dart';
import 'package:cows_bulls_game/ui/common/keyboard/consts/keyboard_style_consts.dart';
import 'package:cows_bulls_game/ui/common/keyboard/keyboard_widget.dart';
import 'package:cows_bulls_game/single_player_game/turns_history_widgets/turns_history_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'keyboard_widgets/single_keyboard_main_part.dart';

class GameUIWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<SinglePlayerGameStore>(context, listen: false);
    return Expanded(child: Observer(builder: (contextObserver) {
      List<Widget> widgets = List.empty(growable: true);
      widgets.add(_buildMainGameScreen());
      if (store.gameCompleted.value) {
        widgets.add(GameAlertDialog(
          () => Navigator.of(contextObserver, rootNavigator: true).popUntil((route) => route.isFirst),
          () => store.resetGame()
        ));
      }
      return Stack(children: widgets);
    }));
  }

  Widget _buildMainGameScreen() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 2, 
            child: TurnsHistoryList()
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: KeyboardWidget(
                SingleKeyboardMainPart(), 
                SingleGameSideKeyboard()
              ),
              decoration: keyboardDecoration
            )
          )
        ]);
  }
}
