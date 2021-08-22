import 'dart:async';

import 'package:cows_bulls_game/ai/AI.dart';
import 'package:cows_bulls_game/model/ai/ai_parameters_state.dart';
import 'package:cows_bulls_game/model/ai/guess_feedback.dart';
import 'package:cows_bulls_game/model/digit_button_type_enum.dart';
import 'package:cows_bulls_game/model/game_side_enum.dart';
import 'package:cows_bulls_game/model/game_turn.dart';
import 'package:cows_bulls_game/model/user_input_cell_data.dart';
import 'package:cows_bulls_game/model/user_input_mode_enum.dart';
import 'package:cows_bulls_game/services/abstract/random_generator.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'pve_game_store.g.dart';

class _PveGameStore extends PveGameStore with _$_PveGameStore {
  _PveGameStore(
    RandomGenerator generator    
  ) : super(generator);
}

abstract class PveGameStore with Store {
  factory PveGameStore.create(
    RandomGenerator generator
  ) => _PveGameStore(generator);

  final RandomGenerator _randomGenerator;

  PveGameStore(
    this._randomGenerator    
  ) {    
    _computerSecret = _randomGenerator.generateSequnce();

    _aiParametersState.secret = _computerSecret;
    _aiParametersState.possibleSecrets = List.from(AI.allCombinations);
    _aiParametersState.unusedGuesses = List.from(AI.allCombinations);
    _aiParametersState.unusedGuesses.shuffle();
  }

  List<int> _computerSecret = [];
  AIParametersState _aiParametersState = AIParametersState();

  Observable<bool> computerThinking = Observable(false);
  Observable<GameSide> gameWinner = Observable(GameSide.none);  
  Observable<int> currentUserInputIndex = Observable(0);
  Observable<UserInputModeEnum> inputMode = Observable(UserInputModeEnum.usualInput);
  
  ObservableList<DigitButtonTypeEnum> digitButtonsState = ObservableList.of(
    [DigitButtonTypeEnum.usual, DigitButtonTypeEnum.usual, DigitButtonTypeEnum.usual,
    DigitButtonTypeEnum.usual, DigitButtonTypeEnum.usual, DigitButtonTypeEnum.usual,
    DigitButtonTypeEnum.usual, DigitButtonTypeEnum.usual, DigitButtonTypeEnum.usual,
    DigitButtonTypeEnum.usual]
  );

  ObservableList<UserInputCellData> currentUserInput = ObservableList.of(
    [
      UserInputCellData(" ", DigitButtonTypeEnum.usual),
      UserInputCellData(" ", DigitButtonTypeEnum.usual),
      UserInputCellData(" ", DigitButtonTypeEnum.usual),
      UserInputCellData(" ", DigitButtonTypeEnum.usual)
    ]
  );
  ObservableList<GameTurn> userTurnHistory = ObservableList();
  ObservableList<GameTurn> aiTurnHistory = ObservableList();
  ObservableList<int> markedDigits = ObservableList();
  
  @action
  Future<void> userMakeTurn() async {
    var intValues = currentUserInput.map(
      (element) => int.parse(element.value)
    ).toList();
    
    String stringGuess = "";
    currentUserInput.forEach((element) {
      stringGuess = "$stringGuess${element.value}";
    });

    GameTurn currentTurn = AI.analyzeTurn(intValues, _computerSecret);    
    userTurnHistory.add(currentTurn);

    List<UserInputCellData> newData = currentUserInput.map((element) {
      if (element.type != DigitButtonTypeEnum.locked) {
        return UserInputCellData(" ", DigitButtonTypeEnum.usual);
      } else {
        return element;
      }      
    }).toList();


    gameWinner.value = currentTurn.bulls == currentUserInput.length
      ? GameSide.user
      : GameSide.none;

    currentUserInput.setAll(0, newData);
    currentUserInputIndex.value = currentUserInput.length - 1;
    currentUserInputIndex.value = _getNextNotLockedCell(currentUserInputIndex.value);

    if (gameWinner.value == GameSide.none) {                    
      computerThinking.value = true;
      _aiParametersState = await compute(AI.makeTurn, _aiParametersState);      
      _aiMakeTurn(_aiParametersState.lastTurn);
    }
  }

  @action
  void _aiMakeTurn(String aiGuess) {    
    GuessFeedback aiTurnFeedback = AI.analyzeAIGuess(aiGuess, _computerSecret);
    GameTurn aiTurn = GameTurn(
      _convertToIntList(aiGuess), 
      aiTurnFeedback.cows, 
      aiTurnFeedback.bulls
    );
    aiTurnHistory.add(aiTurn);
    gameWinner.value = aiTurn.bulls == currentUserInput.length
      ? GameSide.ai
      : GameSide.none;

    computerThinking.value = false;
  }

  @action
  void selectDigitCell(int position) {
    currentUserInputIndex.value = position;
  }

  @action
  void switchInputMode() {
    inputMode.value = (inputMode.value == UserInputModeEnum.usualInput)
      ? UserInputModeEnum.markDigitsInput
      : UserInputModeEnum.usualInput;
  }

  @action
  void toggleLockState(int position) {
    var newType = (currentUserInput[position].type == DigitButtonTypeEnum.usual)
      ? DigitButtonTypeEnum.locked
      : DigitButtonTypeEnum.usual;

    currentUserInput[position] = currentUserInput[position].copyWithType(newType); 
    if (newType == DigitButtonTypeEnum.locked && 
        position == currentUserInputIndex.value) {
      currentUserInputIndex.value = _getNextNotLockedCell(currentUserInputIndex.value);
    }    
  }

  @action
  void digitButtonTap(int digit) {    
    if (inputMode.value == UserInputModeEnum.markDigitsInput) {
      _toggleDigitMark(digit);
    } else {
      _setNumberForCurrentPlace(digit);
    }
  }

  @action
  void backspace() {
    int prevFreeIndex = _getPrevNotLockedCell(currentUserInputIndex.value);    
    if (prevFreeIndex != -1) {
      currentUserInputIndex.value = prevFreeIndex;
      currentUserInput[currentUserInputIndex.value] = 
        currentUserInput[currentUserInputIndex.value].copyWithValue(" ");
    }    
  }

  @action
  void resetGame() {
    aiTurnHistory.clear();
    userTurnHistory.clear();
    markedDigits.clear();

    currentUserInputIndex.value = 0;
    inputMode.value = UserInputModeEnum.usualInput;

    digitButtonsState.clear();
    digitButtonsState.addAll(
      [DigitButtonTypeEnum.usual, DigitButtonTypeEnum.usual, DigitButtonTypeEnum.usual,
      DigitButtonTypeEnum.usual, DigitButtonTypeEnum.usual, DigitButtonTypeEnum.usual,
      DigitButtonTypeEnum.usual, DigitButtonTypeEnum.usual, DigitButtonTypeEnum.usual,
      DigitButtonTypeEnum.usual]
    );

    currentUserInput.clear();
    currentUserInput.addAll(
      [UserInputCellData(" ", DigitButtonTypeEnum.usual), UserInputCellData(" ", DigitButtonTypeEnum.usual),
      UserInputCellData(" ", DigitButtonTypeEnum.usual),
      UserInputCellData(" ", DigitButtonTypeEnum.usual)]
    );

    _computerSecret = _randomGenerator.generateSequnce();
    _aiParametersState.secret = _computerSecret;
    _aiParametersState.possibleSecrets = List.from(AI.allCombinations);
    _aiParametersState.unusedGuesses = List.from(AI.allCombinations);
    _aiParametersState.unusedGuesses.shuffle();

    gameWinner.value = GameSide.none;
  }

  bool isDigitLocked(int digit) {
    UserInputCellData? element = currentUserInput.firstWhereOrNull(
      (element) => element.value == digit.toString() && element.type == DigitButtonTypeEnum.locked      
    );    
    return element != null;
  }

  bool isDigitMarked(int digit) {
    return markedDigits.contains(digit);
  }

  bool _isInputValid() {
    UserInputCellData? element = currentUserInput.firstWhereOrNull(
      (element) => element.value == " "      
    );    
    return element == null;
  }

  bool canMakeTurn() {
    return _isInputValid() && !computerThinking.value;
  }

  void dispose() {}

  void _setNumberForCurrentPlace(int number) {
    UserInputCellData? element = currentUserInput.firstWhereOrNull(
      (element) => element.value == number.toString()      
    );
    
    if (element != null) {
      int index = currentUserInput.indexOf(element);
      currentUserInput[index] = currentUserInput[index].copyWithValue(" ");
    }
    currentUserInput[currentUserInputIndex.value] = 
        currentUserInput[currentUserInputIndex.value].copyWithValue(number.toString());
    currentUserInputIndex.value = _getNextNotLockedCell(currentUserInputIndex.value);        
  }

  void _toggleDigitMark(int digit) {
    if (markedDigits.contains(digit)) {
      markedDigits.remove(digit);
    } else {
      markedDigits.add(digit);
    }
  }

  int _getPrevNotLockedCell(int startIndex) {
    int index = -1;

    if (startIndex > 0) {
      for (int i = startIndex - 1; i >= 0; i--) {
        if (currentUserInput[i].type == DigitButtonTypeEnum.usual) {
          index = i;
          break;
        }
      }
    }

    if (index == -1 && startIndex < currentUserInput.length - 1) {
      for (int i = currentUserInput.length - 1; i > startIndex; i--) {
        if (currentUserInput[i].type == DigitButtonTypeEnum.usual) {
          index = i;
          break;
        }
      }
    }

    return index;
  }

  int _getNextNotLockedCell(int startIndex) {
    int index = -1;

    if (startIndex < currentUserInput.length - 1) {
      for (int i = startIndex + 1; i < currentUserInput.length; i++) {
        if (currentUserInput[i].type == DigitButtonTypeEnum.usual) {
          index = i;
          break;
        }
      }
    }

    if (index == -1 && startIndex > 0) {
      for (int i = 0; i < startIndex; i++) {
        if (currentUserInput[i].type == DigitButtonTypeEnum.usual) {
          index = i;
          break;
        }
      }
    }

    return index;
  }

  List<int> _convertToIntList(String combination) {
    List<String> characters = combination.split("");
    return characters.map((e) => int.parse(e)).toList();    
  }
}