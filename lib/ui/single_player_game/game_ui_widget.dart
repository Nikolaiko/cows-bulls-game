import 'package:cows_bulls_game/mobX/single_player_game_store.dart';
import 'package:cows_bulls_game/ui/common/dialogs/alert_dialog.dart';
import 'package:cows_bulls_game/ui/common/keyboard/consts/keyboard_style_consts.dart';
import 'package:cows_bulls_game/ui/common/keyboard/keyboard_widget.dart';
import 'package:cows_bulls_game/ui/single_player_game/keyboard_widgets/single_game_side_keyboard.dart';
import 'package:cows_bulls_game/ui/single_player_game/keyboard_widgets/single_keyboard_main_part.dart';
import 'package:cows_bulls_game/ui/single_player_game/turns_history_widgets/turns_history_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class GameUIWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<SinglePlayerGameStore>(context, listen: false);
    return Expanded(
      child: Observer(
        builder: (contextObserver) {
          return _buildMainGameScreen(context, store);
        }
      )
    );
  }

  Widget _buildMainGameScreen(
    BuildContext context, 
    SinglePlayerGameStore store
  ) {
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
          child: _buildBottomWidget(
            context, 
            store
          )
        )
      ]
    );
  }

  Widget _buildBottomWidget(BuildContext context, SinglePlayerGameStore store) {
    if (store.gameCompleted.value) {
      return GameAlertDialog(
        () => Navigator.of(context, rootNavigator: true).popUntil((route) => route.isFirst),
        () => store.resetGame()
      );
    } else {
      return _buildKeyboardWidget();
    }
  }

  Widget _buildKeyboardWidget() {
    return Container(
      child: KeyboardWidget(
        SingleKeyboardMainPart(), 
        SingleGameSideKeyboard()
      ),
      decoration: keyboardDecoration
    );
  }
}
