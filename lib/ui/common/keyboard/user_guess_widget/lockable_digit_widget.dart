import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/ui/common/keyboard/consts/keyboard_colors.dart';
import 'package:cows_bulls_game/ui/common/keyboard/consts/keyboard_consts.dart';
import 'package:cows_bulls_game/ui/common/keyboard/consts/keyboard_images.dart';
import 'package:cows_bulls_game/ui/common/keyboard/user_guess_widget/user_guess_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocableDigitWidget extends StatelessWidget {
  final String _buttonText;
  final bool _locked;
  final bool _active;
  final VoidCallback _lockCallback;
  final VoidCallback? _selectCallback;

  LocableDigitWidget(this._buttonText, this._locked, this._active,
      this._lockCallback, this._selectCallback);

  @override
  Widget build(BuildContext context) {
    var dimensions = ScreenDimensions(context);
    return Column(children: [
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _lockCallback,
        child: Container(
          padding: EdgeInsets.all(dimensions.width * currentTryContainerCoff),
          child: SvgPicture.asset(
            lock_digit_image,
            height: dimensions.withoutSafeAreaHeight * currentTryDigitCellCoff,
            color: _locked ? LOCK_LOCKED_COLOR : LOCK_USUAL_COLOR,
          ),
        ),
      ),
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _selectCallback,
        child: Opacity(
          child: UserGuessDigit(_buttonText, _active, dimensions),
          opacity: _locked ? 0.3 : 1.0,
        ),
      )
    ]);
  }
}
