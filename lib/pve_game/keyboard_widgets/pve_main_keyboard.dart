import 'package:cows_bulls_game/mobX/pve_game_store.dart';
import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_consts.dart';
import 'package:cows_bulls_game/ui/common/current_try_numbers_widget.dart';
import 'package:cows_bulls_game/ui/common/input_numbers_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PveMainKeyboard extends StatelessWidget {
  const PveMainKeyboard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dimensions = ScreenDimensions(context);
    var store = Provider.of<PveGameStore>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(height: dimensions.withoutSafeAreaHeight * 0.01),
        Observer(
          builder: (BuildContext context) {
            return CurrentTryNumbersWidget(
              store.currentUserInput,
              store.currentUserInputIndex.value,
              store.toggleLockState,
              store.selectDigitCell
            );
          }
        ),        
        SizedBox(height: dimensions.withoutSafeAreaHeight * 0.01),
        Observer(
          builder:(BuildContext context) {
            return InputNumbersRowWidget(
              const ["1", "2", "3", "4", "5"],
              store.isDigitMarked,
              store.isDigitLocked,
              store.digitButtonTap,
              store.inputMode.value           
            );
          }
        ),
        SizedBox(height: dimensions.width * enterDigitRowSpaceCoeff),
        Observer(
          builder:(BuildContext context) {
            return InputNumbersRowWidget(
              const ["6", "7", "8", "9", "0"],
              store.isDigitMarked,
              store.isDigitLocked,
              store.digitButtonTap,
              store.inputMode.value           
            );
          }
        ),
        SizedBox(height: dimensions.width * 0.01)
      ]
    );
  }
}