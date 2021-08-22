import 'package:cows_bulls_game/consts/gameplay_consts.dart';
import 'package:cows_bulls_game/model/ai/ai_parameters_state.dart';
import 'package:cows_bulls_game/model/ai/guess_feedback.dart';
import 'package:cows_bulls_game/model/collections/pair.dart';
import 'package:cows_bulls_game/model/game_turn.dart';

class AI {
  static const List<int> _allNumbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  static List<String> allCombinations = List.empty(growable: true);

  static void initAllCombinations() {
    List<int> currentNum = List.empty(growable: true);
    for(int firstNumber in _allNumbers) {
      if (!currentNum.contains(firstNumber)) {
        currentNum.add(firstNumber);

        for(int secondNum in _allNumbers) {
          if (!currentNum.contains(secondNum)) {
            currentNum.add(secondNum);

            for(int thirdNum in _allNumbers) {
              if (!currentNum.contains(thirdNum)) {
                currentNum.add(thirdNum);

                for(int fourthNum in _allNumbers) {
                  if (!currentNum.contains(fourthNum)) {
                    currentNum.add(fourthNum);
                    allCombinations.add("${currentNum[0]}${currentNum[1]}${currentNum[2]}${currentNum[3]}");
                    currentNum.removeLast();
                  }
                }
                currentNum.removeLast();
              }
            }
            currentNum.removeLast();
          }
        }
        currentNum.removeLast();
      }
    }
  }

  static AIParametersState makeTurn(AIParametersState state) {    
    String guess = state.unusedGuesses.length == allCombinations.length
      ? state.unusedGuesses.removeLast()
      : _selectNextGuess(state);
    state.lastTurn = guess;

    GuessFeedback feedback = analyzeAIGuess(guess, state.secret);
    List<String> tempSecrets = List.from(state.possibleSecrets);

    for (var currentSecret in tempSecrets) {
      GuessFeedback possibleFeedBack = analyzePossibleSecret(currentSecret, guess);
      if (possibleFeedBack != feedback) {
        state.possibleSecrets.remove(currentSecret);
      }
    }
    return state;
  }

  static String _selectNextGuess(AIParametersState state) {
    List<Pair<String, int>> guessStats = List.empty(growable: true);
    for (String currentGuess in state.unusedGuesses) {
      int maxHits = 0;
      for (String possibleSecrect in state.possibleSecrets) {
        GuessFeedback possibleFeedBack = analyzePossibleSecret(possibleSecrect, currentGuess);
        if (possibleFeedBack.bulls > maxHits) {
          maxHits = possibleFeedBack.bulls;
        }
      }
      guessStats.add(Pair<String, int>(currentGuess, maxHits));
    }    
    guessStats.sort((a, b) => a.second.compareTo(b.second));    
    guessStats = guessStats.reversed.toList();

    var filteredList = guessStats.where(
      (element) => element.second == guessStats.first.second
    ).toList();

    Pair<String, int> selectedGuess = filteredList.firstWhere(
      (element) => state.possibleSecrets.contains(element.first),
      orElse: () => guessStats.first
    );
    
    state.unusedGuesses.remove(selectedGuess.first);
    return selectedGuess.first;
  }

  static GuessFeedback analyzePossibleSecret(String secrect, String guess) {
    List<int> guessTurn = _convertToIntList(guess);
    List<int> possibleSecret = _convertToIntList(secrect);
    int cows = 0;
    int bulls = 0;

    for(int i = 0; i < GamePlayConsts.DIGITS_COUNT; i++) {
      if (guessTurn[i] == possibleSecret[i]) {
        bulls += 1;
      } else if (possibleSecret.contains(guessTurn[i])) {
        cows += 1;
      }
    }
    return GuessFeedback(bulls, cows);
  }

  static GuessFeedback analyzeAIGuess(String guess, List<int> secret) {
    List<int> guessTurn = _convertToIntList(guess);    
    GameTurn result = analyzeTurn(guessTurn, secret);
    return GuessFeedback(result.bulls, result.cows);
  }

  static GameTurn analyzeTurn(List<int> values, List<int> secret) {
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

  static List<int> _convertToIntList(String combination) {
    List<String> characters = combination.split("");
    return characters.map((e) => int.parse(e)).toList();    
  }
}