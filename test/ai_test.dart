import 'package:cows_bulls_game/ai/AI.dart';
import 'package:cows_bulls_game/services/ai_guess_analyzer.dart';
import 'package:cows_bulls_game/services/game_turn_analyzer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  
  test("AI Test", () {
    GameTurnAnalyzer _turnAnalyzer = GameTurnAnalyzer();
    AIGuessAnalyzer _aiAnalyzer = AIGuessAnalyzer(_turnAnalyzer);
    List<int> _secret = [7, 4, 8, 6];
    String _stringSecret = "7486";
    int tries = 0;

    _aiAnalyzer.setSecret(_secret);
    AI ai = AI(_aiAnalyzer);
    ai.prepareForMatch();

    for (int i = 0; i < 10; i++) {
      String guess = ai.makeTurn();
      print("Guess : $guess");
      if (guess == _stringSecret) {
        break;
      }
      tries += 1;
    }        
    expect(tries < 10, true);

  });  
}
