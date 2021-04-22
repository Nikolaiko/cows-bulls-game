import 'package:cows_bulls_game/consts/app_consts.dart';
import 'package:cows_bulls_game/instructions_screen/close_instructions_button.dart';
import 'package:cows_bulls_game/instructions_screen/const/instructions_colors.dart';
import 'package:cows_bulls_game/instructions_screen/const/instructions_consts.dart';
import 'package:cows_bulls_game/main_screen/consts/main_screen_images.dart';
import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/single_player_game/turns_history_widgets/consts/turn_history_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InstructionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenDimensions dimensions = ScreenDimensions(context);
    return Scaffold(      
      body: SafeArea(
        child: Container(
          color: instructionsBackColor,
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    _buildBackgroundImage(dimensions),                    
                    Column(
                      children: [
                        _buildMainScreenTitle(dimensions),
                        _buildRulesTitle(dimensions),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: dimensions.width * 0.05
                            ),
                            child: Column(
                              children:[
                                _buildFirstPartText(dimensions),
                                SizedBox(height: dimensions.withoutSafeAreaHeight * 0.03),
                                _buildBullRow(dimensions),
                                SizedBox(height: dimensions.withoutSafeAreaHeight * 0.03),
                                _buildCowsRow(dimensions),
                                Spacer(),
                                _buildCloseButton(context, dimensions)
                              ]
                            ),
                          ),
                        )                        
                      ]
                    )
                  ]
                )                                                       
              )
            ]
          )                    
        ),
      ),
    );    
  }

  Widget _buildCloseButton(BuildContext context, ScreenDimensions dimensions) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: CloseInstructionsButton("Закрыть", dimensions)
    );
  }

  Widget _buildCowsRow(ScreenDimensions dimensions) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          cowImage
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(left: dimensions.withoutSafeAreaHeight * 0.02),
            child: Text(
              "и число отгаданных цифр, стоящих не на своих местах (число коров)",
              style: TextStyle(
                fontFamily: AppConsts.FONT_FAMILY_NAME,
                fontSize: 14,
                color: instructionsMainTextColor
              )
            ),
          ),
        )
      ]
    );
  }

  Widget _buildBullRow(ScreenDimensions dimensions) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          bullImage
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.only(left: dimensions.withoutSafeAreaHeight * 0.02),
            child: Text(
                "число отгаданных цифр, стоящих на своих местах (число быков)",
                style: TextStyle(
                  fontFamily: AppConsts.FONT_FAMILY_NAME,
                  fontSize: 14,
                  color: instructionsMainTextColor
                )
              ),
          ),
        )
      ]
    );
  }

  Widget _buildFirstPartText(ScreenDimensions dimensions) {
    return Flexible(
      child: Text(
        firstPartText,
        style: TextStyle(
          fontFamily: AppConsts.FONT_FAMILY_NAME,
          fontSize: 14,
          color: instructionsMainTextColor
        ),
      ),
    );
  }

  Widget _buildRulesTitle(ScreenDimensions dimensions) {
    return Padding(
      padding: EdgeInsets.only(
        left: dimensions.withoutSafeAreaHeight * 0.05,
        right: dimensions.withoutSafeAreaHeight * 0.05,
        bottom: dimensions.withoutSafeAreaHeight * 0.05
      ),
      child: Text(
        "Правила",
        style: TextStyle(
          fontFamily: AppConsts.FONT_FAMILY_NAME,
          fontSize: 24,
          color: Colors.red
        ),
      ),
    );
  }

  Widget _buildBackgroundImage(ScreenDimensions dimensions) {
    return SvgPicture.asset(
      backElementsImage,                
      width: dimensions.width,
    );
  }

  Widget _buildMainScreenTitle(ScreenDimensions dimensions) {
    return Column(
      children: [
        SizedBox(height: dimensions.withoutSafeAreaHeight * 0.04),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SvgPicture.asset(
                mainTitleImage,
                width: dimensions.width * 0.5,
              )
            )                  
          ]
        ),
      ]
    );
  }
}