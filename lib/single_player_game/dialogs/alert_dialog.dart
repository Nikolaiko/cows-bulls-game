import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/single_player_game/consts/single_game_image_names.dart';
import 'package:cows_bulls_game/single_player_game/consts/single_game_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GameAlertDialog extends StatelessWidget {
  Function _yesOnPressed;
  Function _noOnPressed;

  GameAlertDialog({String title, String content, Function yesOnPressed, Function noOnPressed, String yes = "Yes", String no = "No"}){
    this._yesOnPressed = yesOnPressed;
    this._noOnPressed = noOnPressed;    
  }

  @override
  Widget build(BuildContext context) {
    ScreenDimensions dimensions = ScreenDimensions(context);
    return Stack(
      children: [
        Container(
          color: Colors.red,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Text("Ts vyigral!")
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