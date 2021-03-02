import 'dart:math';

import 'package:cows_bulls_game/consts/gameplay_consts.dart';
import 'package:cows_bulls_game/services/abstract/random_generator.dart';

class RandomSequnceGenerator extends RandomGenerator{
  final Random _generator = Random();

  @override
  List<int> generateSequnce() {
    List<int> result = [];

    for (int i = 0; i < GamePlayConsts.DIGITS_COUNT; i++) {      
      bool correctDigit = false;
      while(!correctDigit) {
        int currentDigit = _generator.nextInt(10);
        if (!result.contains(currentDigit)) {
          result.add(currentDigit);
          correctDigit = true;
        }
      }
    }
    
    return result;
  }
}