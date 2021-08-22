import 'package:cows_bulls_game/mobX/pve_game_store.dart';
import 'package:cows_bulls_game/model/game_side_enum.dart';
import 'package:cows_bulls_game/ui/common/dialogs/alert_dialog.dart';
import 'package:cows_bulls_game/ui/common/keyboard/consts/keyboard_style_consts.dart';
import 'package:cows_bulls_game/ui/common/keyboard/keyboard_widget.dart';
import 'package:cows_bulls_game/ui/pve_game/dialog/ai_win_dialog.dart';
import 'package:cows_bulls_game/ui/pve_game/keyboard_widgets/pve_main_keyboard.dart';
import 'package:cows_bulls_game/ui/pve_game/keyboard_widgets/pve_side_keyboard.dart';
import 'package:cows_bulls_game/ui/pve_game/turns_history_widgets/ai_turns_history_widget.dart';
import 'package:cows_bulls_game/ui/pve_game/turns_history_widgets/user_turn_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PveUIWidget extends StatelessWidget {
  const PveUIWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<PveGameStore>(context, listen: false);
    return Expanded(
      child: Observer(
        builder: (contextObserver) {
          return _buildMainGameScreen(context, store);      
        }
      )
    );
  }

  Widget _buildMainGameScreen(BuildContext context, PveGameStore store) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 1, 
          child: AITurnHistoryWidget()
        ),
        Container(
          height: 1,
          color: Colors.black,
        ),
        Expanded(
          flex: 1, 
          child: UserTurnsHistoryWidget()
        ),
        Expanded(
          flex: 1,
          child: _buildBottomWidget(context, store)
        )
      ]
    );
  }

  Widget _buildBottomWidget(BuildContext context, PveGameStore store) {
    switch(store.gameWinner.value) {
      case GameSide.none: {
        return _buildKeyboardWidget();        
      }
      case GameSide.ai: {
        return AIWinDialog(
          () => Navigator.of(context, rootNavigator: true).popUntil((route) => route.isFirst),
          () => store.resetGame()
        );
      }
      case GameSide.user: {
        return GameAlertDialog(
          () => Navigator.of(context, rootNavigator: true).popUntil((route) => route.isFirst),
          () => store.resetGame()
        );
      }
    }
  }

  Widget _buildKeyboardWidget() {
    return Container(
      child: KeyboardWidget(
        PveMainKeyboard(), 
        PveSideKeyboard()
      ),
      decoration: keyboardDecoration
    );
  }
}
