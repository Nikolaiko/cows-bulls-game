import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/ui/common/dialogs/consts/dialog_game_styles.dart';
import 'package:flutter/material.dart';

class DialogGrayButton extends StatelessWidget {
  final String _buttonText;

  DialogGrayButton(this._buttonText);

  @override
  Widget build(BuildContext context) {
    ScreenDimensions dimensions = ScreenDimensions(context);
    return Container(
      decoration: dialogGrayButtonDecoration,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: dimensions.withoutSafeAreaHeight * 0.035,
          width: dimensions.width * 0.3,        
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              _buttonText, 
              style: dialogButtonsTextStyle
            ),
          ),
        ),
      ),
    );
  }
}