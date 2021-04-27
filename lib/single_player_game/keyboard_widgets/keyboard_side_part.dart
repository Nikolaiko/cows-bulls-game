import 'package:cows_bulls_game/mobX/single_player_game_store.dart';
import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/model/user_input_mode_enum.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_consts.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_button_widgets/side_button_widgets/icon_side_button_widget.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/keyboard_button_widgets/side_button_widgets/text_side_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class KeyboardSideWidget extends StatelessWidget {
  static const double BETWEEN_BUTTONS_SPACE = 0.1;
  static const String USUAL_MODE_TITLE = "Обычный";
  static const String MARK_MODE_TITLE = "Выделение";

  @override
  Widget build(BuildContext context) {
    var dimens = ScreenDimensions(context);
    var store = Provider.of<SinglePlayerGameStore>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,      
      children: [
        Observer(
          builder: (observerContext) {
            return GestureDetector(
              onTap: store.isInputValid() 
                ? () => store.makeTurn()
                : null,
              child: TextSideButtonWidget(
                "ВВОД",
                dimens
              ),
            );
          }
        ),      
        SizedBox(height: dimens.withoutSafeAreaHeight * 0.02),  
        GestureDetector(
          onTap: () => store.backspace(),
          child: IconSideButtonWidget(
            Icons.backspace_outlined,
            dimens
          ),
        ),
        SizedBox(height: dimens.width * enterDigitRowSpaceCoeff),
        Observer(
          builder: (observerContext) {
            return GestureDetector(
              onTap: () => store.switchInputMode(),
              child: IconSideButtonWidget(
                store.inputMode.value == UserInputModeEnum.usualInput 
                  ? Icons.edit_outlined
                  : Icons.edit_sharp,
                dimens
              ),
            );
          }
        ),
        SizedBox(height: dimens.width * 0.01)              
      ] 
    );
  }
}  

    