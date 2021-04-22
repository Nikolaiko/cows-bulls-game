import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_consts.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/current_try_numbers_widget.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/input_numbers_row_widget.dart';
import 'package:flutter/material.dart';

class KeyboardMainPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dimensions = ScreenDimensions(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(height: dimensions.withoutSafeAreaHeight * 0.02),
        CurrentTryNumbersWidget(),
        SizedBox(height: dimensions.withoutSafeAreaHeight * 0.02),
        InputNumbersRowWidget(
          rowLabels: ["1", "2", "3", "4", "5"]            
        ),
        SizedBox(height: dimensions.width * enterDigitRowSpaceCoeff),
        InputNumbersRowWidget(
          rowLabels: ["6", "7", "8", "9", "0"]
        ),
        SizedBox(height: dimensions.width * enterDigitBottomSpaceCoeff)
      ]
    );
  }
}