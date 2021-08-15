import 'package:cows_bulls_game/model/ai/guess_feedback.dart';
import 'package:cows_bulls_game/services/abstract/blind_guess_analyzer.dart';
import 'package:flutter/material.dart';

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

  void makeTurn() {
    if (unusedGuesses.length == allCombinations.length) {
      String firstGuess = unusedGuesses.removeLast();
      GuessFeedback feedback = _analyzer.analyzeGuess(firstGuess);
      List<String> tempSecrets = List.from(possibleSecrets);

      
    }
  }

  GuessFeedback _calculateFeedback(String secret, String guess) {
    int cows = 0;
    int bulls = 0;

    for(int index = 0; index < guess.length; index++) {
      if (guess[index] == secret[index]) {
        bulls += 1;        
      } else if (secret.contains(guess[index])) {
        cows += 1;
      }
    }
    return GuessFeedback(bulls, cows);
  }

}