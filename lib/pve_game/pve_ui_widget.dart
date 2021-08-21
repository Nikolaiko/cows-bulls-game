import 'package:cows_bulls_game/consts/common_ui_consts/common_ui_styles.dart';
import 'package:cows_bulls_game/mobX/pve_game_store.dart';
import 'package:cows_bulls_game/pve_game/keyboard_widgets/pve_main_keyboard.dart';
import 'package:cows_bulls_game/pve_game/keyboard_widgets/pve_side_keyboard.dart';
import 'package:cows_bulls_game/single_player_game/dialogs/alert_dialog.dart';
import 'package:cows_bulls_game/ui/common/keyboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PveUIWidget extends StatelessWidget {
  const PveUIWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<PveGameStore>(context, listen: false);    
    return Expanded(
      child: Observer(
        builder: (contextObserver) {
          List<Widget> widgets = List.empty(growable: true);
          widgets.add(_buildMainGameScreen());
          if (store.gameCompleted.value) {
            widgets.add(GameAlertDialog(
            () => Navigator.of(context).pop(),
            () => store.resetGame()
          ));
          }
          return Stack(children: widgets);
        }
      )
    );
  }

  Widget _buildMainGameScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 1,
          child: Container(color: Colors.black)
        ),
        Expanded(
          flex: 1,
          child: Container(color: Colors.amber)
        ),
        Expanded(
          flex: 1,
          child: Container(              
            child: KeyboardWidget(
              PveMainKeyboard(),
              PveSideKeyboard()
            ),     
            decoration: keyboardDecoration
          )            
        )
      ]
    );
  }
}