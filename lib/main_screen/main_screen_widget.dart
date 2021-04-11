import 'package:cows_bulls_game/main_screen/consts/main_screen_colors.dart';
import 'package:cows_bulls_game/main_screen/consts/main_screen_images.dart';
import 'package:cows_bulls_game/main_screen/consts/main_screen_text_styles.dart';
import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/single_player_game/single_game_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenDimensions dimensions = ScreenDimensions(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: mainScreenBackColor,
          child: Stack(
            children: [
              _buildMainScreenTitle(),
              _buildMainScreenImage(dimensions),              
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: dimensions.width * 0.3),
                    child: ElevatedButton(                                              
                      style: playButtonStyle,
                      child: Text("Играть!", style: mainButtonsStyle, textAlign: TextAlign.center),
                      onPressed: () { _startSinglePlayerGame(context); }
                    ),
                  ),
                  SizedBox(height: dimensions.withoutSafeAreaHeight * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: dimensions.width * 0.3),
                    child: ElevatedButton(                                              
                      style: rulesButtonStyle,
                      child: Text("Правила", style: mainButtonsStyle, textAlign: TextAlign.center),
                      onPressed: null
                    ),
                  ),
                  SizedBox(height: dimensions.withoutSafeAreaHeight * 0.1)
                ]
              )
            ]
          ),
        ),
      ),
    );
  }

  Widget _buildMainScreenImage(ScreenDimensions dimensions) {
    return Center(
      child: SvgPicture.asset(
        cowAndBullImage,                
        width: dimensions.width,
      ),
    );
  }

  Widget _buildMainScreenTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SvgPicture.asset(
            mainTitleImage                
          )
        )                  
      ]
    );
  }

  void _startSinglePlayerGame(BuildContext context) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (routeContext) {
          return SingleGameInitializer();
        }
      )
    );
  }
}