import 'package:cows_bulls_game/model/callback_types.dart';
import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/model/user_input_mode_enum.dart';
import 'package:cows_bulls_game/ui/common/keyboard/consts/keyboard_consts.dart';
import 'package:cows_bulls_game/ui/common/keyboard/keyboard_button_widgets/side_button_widgets/icon_side_button_widget.dart';
import 'package:cows_bulls_game/ui/common/keyboard/keyboard_button_widgets/side_button_widgets/text_side_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class KeyboardSideWidget extends StatelessWidget {
  static const double BETWEEN_BUTTONS_SPACE = 0.1;
  static const String USUAL_MODE_TITLE = "Обычный";
  static const String MARK_MODE_TITLE = "Выделение";

  final BooleanCheckFunction _canMakeTurn;
  final VoidCallback _makeTurn;
  final VoidCallback _switchInputType;
  final VoidCallback _backspace;
  final UserInputModeEnum _inputType;

  KeyboardSideWidget(this._canMakeTurn, this._makeTurn, this._backspace,
      this._switchInputType, this._inputType);

  @override
  Widget build(BuildContext context) {
    var dimens = ScreenDimensions(context);
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Observer(builder: (observerContext) {
        return GestureDetector(
          onTap: _canMakeTurn() ? _makeTurn : null,
          child: TextSideButtonWidget("ВВОД", dimens),
        );
      }),
      SizedBox(height: dimens.withoutSafeAreaHeight * 0.02),
      GestureDetector(
        onTap: _backspace,
        child: IconSideButtonWidget(Icons.backspace_outlined, dimens),
      ),
      SizedBox(height: dimens.width * enterDigitRowSpaceCoeff),
      GestureDetector(
        onTap: _switchInputType,
        child: IconSideButtonWidget(
          _inputType == UserInputModeEnum.usualInput
            ? Icons.edit_outlined
            : Icons.edit_sharp,
          dimens
        ),
      ),
      SizedBox(height: dimens.width * 0.01)
    ]);
  }
}
