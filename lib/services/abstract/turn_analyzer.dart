import 'package:cows_bulls_game/model/game_turn.dart';

abstract class TurnAnalyzer {
  GameTurn analyzeTurn(List<int> values, List<int> secret);
}