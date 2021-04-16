import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_consts.dart';
import 'package:cows_bulls_game/single_player_game/keyboard_widgets/consts/keyboard_decoration_consts.dart';
import 'package:flutter/material.dart';

class IconSideButtonWidget extends StatelessWidget {  
  final double _side;  
  final IconData _icon;

  IconSideButtonWidget(    
    this._icon,
    dimensions
  ) : _side = dimensions.withoutSafeAreaHeight * currentTryDigitCellCoff;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: usualNumberDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          height: _side,        
          width: _side * 2,
          child: Icon(
            _icon,
            color: Colors.black      
          ),
        ),
      ),
    );
  }
}