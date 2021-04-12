import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_consts.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_button_widgets/user_guess_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocableDigitWidget extends StatelessWidget {
  final String _buttonText;
  final bool _locked;
  final bool _active;

  LocableDigitWidget(
    this._buttonText,
    this._locked,
    this._active
  );

  @override
  Widget build(BuildContext context) {
    var dimensions = ScreenDimensions(context);
    return Column(
      children: [
        SvgPicture.asset(
          "assets/images/lock.svg",                
          width: dimensions.width * currentTryDigitCellCoff,
        ),
        SizedBox(height: dimensions.withoutSafeAreaHeight * 0.002),
        UserGuessDigit(_buttonText, _active, dimensions)
      ]
    );
  }
}