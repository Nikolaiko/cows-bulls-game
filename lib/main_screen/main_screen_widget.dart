import 'package:cows_bulls_game/instructions_screen/instructions_screen.dart';
import 'package:cows_bulls_game/main_screen/consts/main_screen_colors.dart';
import 'package:cows_bulls_game/main_screen/consts/main_screen_images.dart';
import 'package:cows_bulls_game/main_screen/consts/main_screen_text_styles.dart';
import 'package:cows_bulls_game/main_screen/main_screen_button.dart';
import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/pve_game/pve_game_initializer.dart';
import 'package:cows_bulls_game/single_player_game/single_game_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenDimensions dimensions = ScreenDimensions(context);
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          width: dimensions.width,
          height: dimensions.fullHeight,
          color: mainScreenBackColor,
          child: Stack(            
            children: [
              _buildBackgroundImage(dimensions),
              _buildMainScreenImage(dimensions),              
              _buildMainScreenTitle(dimensions),              
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => _startSinglePlayerGame(context),
                          child: MainScreenButton(
                            "Играть!", 
                            dimensions,
                            playButtonDecoration,
                            playButtonTextStyle
                          )
                        ),                        
                        SizedBox(height: dimensions.withoutSafeAreaHeight * 0.01),
                        GestureDetector(
                          onTap: () => _startPveGame(context),
                          child: MainScreenButton(
                            "Против AI!", 
                            dimensions,
                            playButtonDecoration,
                            playButtonTextStyle
                          )
                        ),                        
                        SizedBox(height: dimensions.withoutSafeAreaHeight * 0.01),
                        GestureDetector(
                          onTap: () => _openInstructionsScreen(context),
                          child: MainScreenButton(
                            "Правила", 
                            dimensions,
                            rulesButtonDecoration,
                            rulesButtonTextStyle
                          )
                        ),
                        SizedBox(height: dimensions.withoutSafeAreaHeight * 0.1)
                      ]
                    ),
                  )
                ]
              )
            ]
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundImage(ScreenDimensions dimensions) {
    print(dimensions.width);
    return SvgPicture.asset(
      backElementsImage,                
      width: dimensions.width,
    );
  }

  Widget _buildMainScreenImage(ScreenDimensions dimensions) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            bullSingleImage,
            height: dimensions.fullHeight * 0.4
          ),
          SvgPicture.asset(
            cowSinleImage,
            height: dimensions.fullHeight * 0.3
          )
        ]
      ),
    );
  }

  Widget _buildMainScreenTitle(ScreenDimensions dimensions) {    
    return Column(
      children: [
        SizedBox(height: dimensions.withoutSafeAreaHeight * 0.04),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: dimensions.width * 0.7,
              height: dimensions.fullHeight * 0.3,              
              child: SvgPicture.asset(mainTitleImage)
            )                  
          ]
        ),
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

  void _startPveGame(BuildContext context) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (routeContext) {
          return PveGameInitializer();
        }
      )
    );
  }

  void _openInstructionsScreen(BuildContext context) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (routeContext) {
          return InstructionsScreen();
        }
      )
    );
  }
}