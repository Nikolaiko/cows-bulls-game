import 'package:cows_bulls_game/mobX/pve_game_store.dart';
import 'package:cows_bulls_game/ui/common/keyboard/keyboard_side_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PveSideKeyboard extends StatelessWidget {
  const PveSideKeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<PveGameStore>(context, listen: false);
    return Observer(builder: (BuildContext context) {
      return KeyboardSideWidget(store.canMakeTurn, store.userMakeTurn,
          store.backspace, store.switchInputMode, store.inputMode.value);
    });
  }
}
