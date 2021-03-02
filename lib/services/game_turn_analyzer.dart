import 'package:cows_bulls_game/consts/gameplay_consts.dart';
import 'package:cows_bulls_game/model/game_turn.dart';
import 'package:cows_bulls_game/services/abstract/turn_analyzer.dart';

class GameTurnAnalyzer extends TurnAnalyzer {

  @override
  GameTurn analyzeTurn(List<int> values, List<int> secret) {
    int cows = 0;
    int bulls = 0;

    for(int i = 0; i < GamePlayConsts.DIGITS_COUNT; i++) {
      if (values[i] == secret[i]) {
        bulls += 1;
      } else if (secret.contains(values[i])) {
        cows += 1;
      }
    }
    return GameTurn(values, cows, bulls);
  }

}