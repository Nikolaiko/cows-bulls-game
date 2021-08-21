import 'package:cows_bulls_game/model/ai/guess_feedback.dart';
import 'package:cows_bulls_game/model/collections/pair.dart';
import 'package:cows_bulls_game/services/abstract/blind_guess_analyzer.dart';

class AI {
  static const List<int> allNumbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  final BlindGuessAnalyzer _analyzer;

  List<String> allCombinations = List.empty(growable: true);
  List<String> possibleSecrets = List.empty();
  List<String> unusedGuesses = List.empty();

  AI(this._analyzer) {
    _initAllCombinations();
  }

  void _initAllCombinations() {
    List<int> currentNum = List.empty(growable: true);
    for(int firstNumber in allNumbers) {
      if (!currentNum.contains(firstNumber)) {
        currentNum.add(firstNumber);

        for(int secondNum in allNumbers) {
          if (!currentNum.contains(secondNum)) {
            currentNum.add(secondNum);

            for(int thirdNum in allNumbers) {
              if (!currentNum.contains(thirdNum)) {
                currentNum.add(thirdNum);

                for(int fourthNum in allNumbers) {
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

  void prepareForMatch() {
    possibleSecrets = List.from(allCombinations);
    unusedGuesses = List.from(allCombinations);
    unusedGuesses.shuffle();    
  }

  String makeTurn() {
    String guess = unusedGuesses.length == allCombinations.length
      ? unusedGuesses.removeLast()
      : _selectNextGuess();

    GuessFeedback feedback = _analyzer.analyzeGuess(guess);
    List<String> tempSecrets = List.from(possibleSecrets);

    for (var currentSecret in tempSecrets) {
      GuessFeedback possibleFeedBack = _analyzer.analyzePossibleSecret(currentSecret, guess);
      if (possibleFeedBack != feedback) {
        possibleSecrets.remove(currentSecret);
      }
    }
    return guess;    
  }

  String _selectNextGuess() {
    List<Pair<String, int>> guessStats = List.empty(growable: true);
    for (String currentGuess in unusedGuesses) {
      int maxHits = 0;
      for (String possibleSecrect in possibleSecrets) {
        GuessFeedback possibleFeedBack = _analyzer.analyzePossibleSecret(possibleSecrect, currentGuess);
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
      (element) => possibleSecrets.contains(element.first),
      orElse: () => guessStats.first
    );

    unusedGuesses.remove(selectedGuess.first);
    return selectedGuess.first;
  }
}