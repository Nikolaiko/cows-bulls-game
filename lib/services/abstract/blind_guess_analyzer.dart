import 'package:cows_bulls_game/model/ai/guess_feedback.dart';

abstract class BlindGuessAnalyzer {
  GuessFeedback analyzeGuess(String guess);
  GuessFeedback analyzePossibleSecret(String secrect, String guess);
}