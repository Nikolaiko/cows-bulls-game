import 'package:cows_bulls_game/model/digit_button_type_enum.dart';
import 'package:cows_bulls_game/model/game_turn.dart';
import 'package:cows_bulls_game/model/user_input_cell_data.dart';
import 'package:cows_bulls_game/model/user_input_mode_enum.dart';
import 'package:cows_bulls_game/services/abstract/random_generator.dart';
import 'package:cows_bulls_game/services/abstract/turn_analyzer.dart';
import 'package:mobx/mobx.dart';

part 'single_player_game_store.g.dart';

class _SinglePlayerGameStore extends SinglePlayerGameStore with _$_SinglePlayerGameStore {
  _SinglePlayerGameStore(RandomGenerator generator, TurnAnalyzer analyzer) : super(generator, analyzer);
}

abstract class SinglePlayerGameStore with Store {
  factory SinglePlayerGameStore.create(
    RandomGenerator generator,
    TurnAnalyzer analyzer
  ) => _SinglePlayerGameStore(generator, analyzer);

  final RandomGenerator _randomGenerator;  
  final TurnAnalyzer _turnAnalyzer;  

  SinglePlayerGameStore(this._randomGenerator, this._turnAnalyzer) {    
    _computerSecret = _randomGenerator.generateSequnce();
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
  ObservableList<GameTurn> turnHistory = ObservableList();
  ObservableList<int> markedDigits = ObservableList();
  
  @action
  void makeTurn() {    
    var intValues = currentUserInput.map(
      (element) => int.parse(element.value)
    ).toList();
    
    var currentTurn = _turnAnalyzer.analyzeTurn(intValues, _computerSecret);
    turnHistory.add(currentTurn);

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
  void backspace() {
    int prevFreeIndex = _getPrevNotLockedCell(currentUserInputIndex.value);    
    if (prevFreeIndex != -1) {
      currentUserInputIndex.value = prevFreeIndex;
      currentUserInput[currentUserInputIndex.value] = 
        currentUserInput[currentUserInputIndex.value].copyWithValue(" ");
    }    
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
  void resetGame() {
    turnHistory.clear();
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
    gameCompleted.value = false;
  }

  void _setNumberForCurrentPlace(int number) {
    var element = currentUserInput.firstWhere(
      (element) => element.value == number.toString(),
      orElse: () => null
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

  bool isDigitLocked(int digit) {
    var element = currentUserInput.firstWhere(
      (element) => element.value == digit.toString() && element.type == DigitButtonTypeEnum.locked,
      orElse: () => null
    );    
    return element != null;
  }

  bool isDigitMarked(int digit) {
    return markedDigits.contains(digit);
  }

  bool isInputValid() {
    var element = currentUserInput.firstWhere(
      (element) => element.value == " ",
      orElse: () => null
    );    
    return element == null;
  }

  void dispose() {
    
  }
}