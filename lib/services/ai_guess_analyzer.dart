import 'package:cows_bulls_game/model/ai/guess_feedback.dart';
import 'package:cows_bulls_game/model/game_turn.dart';
import 'package:cows_bulls_game/services/abstract/blind_guess_analyzer.dart';
import 'package:cows_bulls_game/services/abstract/turn_analyzer.dart';

class AIGuessAnalyzer extends BlindGuessAnalyzer {
  final TurnAnalyzer _turnAnalyzer;

  List<int> _computerSecret = List.empty();

  AIGuessAnalyzer(
    this._turnAnalyzer
  );

  @override
  void setSecret(List<int> secret) {
    _computerSecret = secret;
  }

  @override
  GuessFeedback analyzeGuess(String guess) {
    List<int> guessTurn = _convertToIntList(guess);
    GameTurn turn = _turnAnalyzer.analyzeTurn(guessTurn, _computerSecret);
    return GuessFeedback(turn.bulls, turn.cows);
  }

  @override
  GuessFeedback analyzePossibleSecret(String secrect, String guess) {
    List<int> guessTurn = _convertToIntList(guess);
    List<int> possibleSecret = _convertToIntList(secrect);
    GameTurn result = _turnAnalyzer.analyzeTurn(guessTurn, possibleSecret);
    return GuessFeedback(result.bulls, result.cows);
  }

  List<int> _convertToIntList(String combination) {
    List<String> characters = combination.split("");
    return characters.map((e) => int.parse(e)).toList();    
  }
}