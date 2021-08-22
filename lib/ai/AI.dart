import 'dart:isolate';

import 'package:cows_bulls_game/consts/gameplay_consts.dart';
import 'package:cows_bulls_game/model/ai/guess_feedback.dart';
import 'package:cows_bulls_game/model/callback_types.dart';
import 'package:cows_bulls_game/model/collections/pair.dart';
import 'package:cows_bulls_game/model/game_turn.dart';
import 'package:cows_bulls_game/services/abstract/blind_guess_analyzer.dart';

class AI {
  static const List<int> _allNumbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  static List<String> _allCombinations = List.empty(growable: true);
  static List<String> _possibleSecrets = List.empty();
  static List<String> _unusedGuesses = List.empty();
  static List<int> _secret = List.empty();

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
                    _allCombinations.add("${currentNum[0]}${currentNum[1]}${currentNum[2]}${currentNum[3]}");
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

  static void prepareForMatch(List<int> secret) {
    _secret = secret;
    _possibleSecrets = List.from(_allCombinations);
    _unusedGuesses = List.from(_allCombinations, growable: true);
    _unusedGuesses.shuffle();    
  }

  static String makeTurn(String message) {    
    String guess = _unusedGuesses.length == _allCombinations.length
      ? _unusedGuesses.removeLast()
      : _selectNextGuess();

    GuessFeedback feedback = analyzeAIGuess(guess);
    List<String> tempSecrets = List.from(_possibleSecrets);

    for (var currentSecret in tempSecrets) {
      GuessFeedback possibleFeedBack = analyzePossibleSecret(currentSecret, guess);
      if (possibleFeedBack != feedback) {
        _possibleSecrets.remove(currentSecret);
      }
    }
    return guess;
  }

  static String _selectNextGuess() {
    List<Pair<String, int>> guessStats = List.empty(growable: true);
    for (String currentGuess in _unusedGuesses) {
      int maxHits = 0;
      for (String possibleSecrect in _possibleSecrets) {

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
      (element) => _possibleSecrets.contains(element.first),
      orElse: () => guessStats.first
    );
    
    _unusedGuesses.remove(selectedGuess.first);
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

  static GuessFeedback analyzeAIGuess(String guess) {
    List<int> guessTurn = _convertToIntList(guess);    
    GameTurn result = analyzeTurn(guessTurn);
    return GuessFeedback(result.bulls, result.cows);
  }

  static GameTurn analyzeTurn(List<int> values) {
    int cows = 0;
    int bulls = 0;

    for(int i = 0; i < GamePlayConsts.DIGITS_COUNT; i++) {
      if (values[i] == _secret[i]) {
        bulls += 1;
      } else if (_secret.contains(values[i])) {
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