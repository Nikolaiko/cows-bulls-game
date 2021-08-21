import 'package:cows_bulls_game/model/screen_dimensions.dart';
import 'package:cows_bulls_game/ui/common/turn_history_widgets/consts/turn_history_images.dart';
import 'package:cows_bulls_game/ui/common/turn_history_widgets/consts/turn_history_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TurnRecordWidget extends StatelessWidget {
  final int _index;
  final String _userInput;
  final int _cows;
  final int _bulls;

  TurnRecordWidget(
    this._index,
    this._userInput,
    this._cows,
    this._bulls
  );

  @override
  Widget build(BuildContext context) {   
    ScreenDimensions dimensions = ScreenDimensions(context); 
    return Container(      
      child: Row(   
        crossAxisAlignment: CrossAxisAlignment.center,     
        children: [
          Flexible(
            fit: FlexFit.loose,
            flex: 2,
            child: Row(      
              crossAxisAlignment: CrossAxisAlignment.center,        
              mainAxisAlignment: MainAxisAlignment.end,
              children:[ 
                Text(
                  "${_index + 1}",
                  style: historyIndexTextStyle
                )
              ]
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Container(              
              color: Colors.transparent
            ),
          ),
          Flexible(
            flex: 2,
            child: Text(
              _userInput,
              style: historyNumbersTextStyle
            ),
          ),
           Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Container(
              height: dimensions.withoutSafeAreaHeight * 0.05,
              color: Colors.transparent
            ),
          ),
          Flexible(
            flex: 5,
            fit: FlexFit.loose,
            child: Row(
              children: _buildIconsRow(dimensions)
            ),
          )
        ]
      ),
    );
  }

  List<Widget> _buildIconsRow(ScreenDimensions dimensions) {
    int index = _bulls;
    List<Widget> icons = List.empty(growable: true);    
    while (index > 0) {
      icons.add(
        SvgPicture.asset(
          bullImage          
        )        
      );
      index--;
    }

    index = _cows;
    while (index > 0) {
      icons.add(
        SvgPicture.asset(
          cowImage          
        ),        
      );
      index--;
    }

    if (icons.isEmpty) {
      icons.add(
        SvgPicture.asset(
          emptySignImage          
        ),        
      );
    }

    return icons;
  }
}