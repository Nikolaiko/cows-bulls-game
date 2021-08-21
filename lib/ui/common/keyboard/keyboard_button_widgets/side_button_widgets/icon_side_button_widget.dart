import 'package:cows_bulls_game/ui/common/keyboard/consts/keyboard_consts.dart';
import 'package:cows_bulls_game/ui/common/keyboard/consts/keyboard_decoration_consts.dart';
import 'package:flutter/material.dart';

class IconSideButtonWidget extends StatelessWidget {
  final double _side;
  final IconData _icon;

  IconSideButtonWidget(this._icon, dimensions)
      : _side = dimensions.withoutSafeAreaHeight * enterDigitSideCoeff;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: usualNumberDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          height: _side,
          width: _side * 2,
          child: Icon(_icon, color: Colors.black),
        ),
      ),
    );
  }
}
