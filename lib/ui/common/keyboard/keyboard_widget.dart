import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:flutter/material.dart';

class KeyboardWidget extends StatelessWidget {
  final Widget mainPartWidget;
  final Widget sidePartWidget;

  const KeyboardWidget(
    this.mainPartWidget,
    this.sidePartWidget,
    { Key? key }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    var dimensions = ScreenDimensions(context);   
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                    children: [
                      Flexible(
                        flex: 6, 
                        child: mainPartWidget
                      ),
                      Flexible(
                        flex: 2, 
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: dimensions.width * 0.05
                          ),
                          child: sidePartWidget,
                        )
                      )
                    ]
                  ),
              )
            ]
          )
        )        
      ]
    );
  }
}