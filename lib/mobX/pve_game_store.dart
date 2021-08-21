import 'package:cows_bulls_game/ai/AI.dart';
import 'package:cows_bulls_game/model/ai/guess_feedback.dart';
import 'package:cows_bulls_game/model/digit_button_type_enum.dart';
import 'package:cows_bulls_game/model/game_turn.dart';
import 'package:cows_bulls_game/model/user_input_cell_data.dart';
import 'package:cows_bulls_game/model/user_input_mode_enum.dart';
import 'package:cows_bulls_game/services/abstract/blind_guess_analyzer.dart';
import 'package:cows_bulls_game/services/abstract/random_generator.dart';
import 'package:cows_bulls_game/services/abstract/turn_analyzer.dart';
import 'package:collection/collection.dart';
import 'package:mobx/mobx.dart';

part 'pve_game_store.g.dart';

class _PveGameStore extends PveGameStore with _$_PveGameStore {
  _PveGameStore(
    RandomGenerator generator, 
    BlindGuessAnalyzer analyzer,
    AI ai
  ) : super(generator, analyzer, ai);
}

abstract class PveGameStore with Store {
  factory PveGameStore.create(
    RandomGenerator generator,
    BlindGuessAnalyzer analyzer,
    AI ai
  ) => _PveGameStore(generator, analyzer, ai);

  final RandomGenerator _randomGenerator;
  final BlindGuessAnalyzer _turnAnalyzer;
  final AI _ai;

  PveGameStore(
    this._randomGenerator,
    this._turnAnalyzer,
    this._ai
  ) {
    _computerSecret = _randomGenerator.generateSequnce();
    _turnAnalyzer.setSecret(_computerSecret);
  }

  List<int> _computerSecret = [];

  Observable<bool> gameCompleted = Observable(false);
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
  void makeTurn() {    
    var intValues = currentUserInput.map(
      (element) => int.parse(element.value)
    ).toList();
    
    String stringGuess = "";
    currentUserInput.forEach((element) {
      stringGuess = "$stringGuess${element.value}";
    });

    GuessFeedback feedback = _turnAnalyzer.analyzeGuess(stringGuess);
    GameTurn currentTurn = GameTurn(intValues, feedback.cows, feedback.bulls);
    userTurnHistory.add(currentTurn);

    List<UserInputCellData> newData = currentUserInput.map((element) {
      if (element.type != DigitButtonTypeEnum.locked) {
        return UserInputCellData(" ", DigitButtonTypeEnum.usual);
      } else {
        return element;
      }      
    }).toList();


    gameCompleted.value = currentTurn.bulls == currentUserInput.length;
    currentUserInput.setAll(0, newData);
    currentUserInputIndex.value = currentUserInput.length - 1;
    currentUserInputIndex.value = _getNextNotLockedCell(currentUserInputIndex.value);   
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

  bool isInputValid() {
    UserInputCellData? element = currentUserInput.firstWhereOrNull(
      (element) => element.value == " "      
    );    
    return element == null;
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
}