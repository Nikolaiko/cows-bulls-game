import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/single_player_game/consts/single_game_image_names.dart';
import 'package:cows_bulls_game/single_player_game/consts/single_game_styles.dart';
import 'package:cows_bulls_game/single_player_game/dialogs/dialog_gray_button.dart';
import 'package:cows_bulls_game/single_player_game/dialogs/dialog_red_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GameAlertDialog extends StatelessWidget {
  final Function _yesOnPressed;
  final Function _noOnPressed;

  GameAlertDialog(
    this._noOnPressed,
    this._yesOnPressed
  );

  @override
  Widget build(BuildContext context) {
    ScreenDimensions dimensions = ScreenDimensions(context);
    return Stack(
      children: [
        Container(
          color: Colors.transparent,
          width: dimensions.width,
          height: dimensions.withoutSafeAreaHeight          
        ),
        Center(
          child: Container(                
            decoration: dialogDecoration,
            width: dimensions.width * 0.8,
            height: dimensions.width * 0.55,                          
            child: Stack(
              children: [
                SvgPicture.asset(dialogElements),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: dimensions.withoutSafeAreaHeight * 0.1),
                          Text(
                            "Ты выиграл!",
                            style: dialogTitleTextStyle,
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:[
                              GestureDetector(
                                onTap: _noOnPressed,
                                child: DialogGrayButton("Выход")
                              ),                              
                              GestureDetector(
                                onTap: _yesOnPressed,
                                child: DialogRedButton("Еще раз")
                              )
                            ]
                          ),
                          SizedBox(height: dimensions.withoutSafeAreaHeight * 0.04),
                      ],)
                    )  
                  ],
                )
              ]
            ),
          ),
        ),
      ]
    );
  }
}