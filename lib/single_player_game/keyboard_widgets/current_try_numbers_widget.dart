import 'package:cows_bulls_game/mobX/single_player_game_store.dart';
import 'package:cows_bulls_game/model/digit_button_type_enum.dart';
import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/model/user_input_cell_data.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_consts.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_button_widgets/user_guess_widget/lockable_digit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CurrentTryNumbersWidget extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {
    var dimensions = ScreenDimensions(context);
    return Observer(
      builder: (observerContext) {  
        var store = Provider.of<SinglePlayerGameStore>(context);                  
        return Row(          
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildRowElements(store, dimensions)
        );
      }          
    );
  }

  List<Widget> _buildRowElements(SinglePlayerGameStore store, ScreenDimensions dimensions) {    
    List<UserInputCellData> currentTryValues = store.currentUserInput;
    int selectedIndex = store.currentUserInputIndex.value;
    List<Widget> widgets = [];

    for (int i = 0; i < currentTryValues.length; i++) {
      widgets.add(
        Padding(
          padding: (i == currentTryValues.length - 1) ? EdgeInsets.zero : _buildSideInsets(dimensions),
          child: LocableDigitWidget(
            currentTryValues[i].value, 
            currentTryValues[i].type != DigitButtonTypeEnum.usual,
            selectedIndex == i,
            () => store.toggleLockState(i),
            (currentTryValues[i].type == DigitButtonTypeEnum.usual)
              ? () => store.selectDigitCell(i)
              : null
          )
        )
      );
    }
    return widgets;
  }

  EdgeInsets _buildSideInsets(ScreenDimensions dimensions) {
    return EdgeInsets.only(
      right: dimensions.width * currentTryDigitSpacingCoff
    );
  }
}