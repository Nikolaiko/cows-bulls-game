import 'package:cows_bulls_game/model/digit_button_type_enum.dart';
import 'package:cows_bulls_game/model/game_turn.dart';
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

  Observable<int> currentUserInputIndex = Observable(0);
  Observable<UserInputModeEnum> inputMode = Observable(UserInputModeEnum.usualInput);

  ObservableList<DigitButtonTypeEnum> digitButtonsState = ObservableList.of(
    [DigitButtonTypeEnum.usual, DigitButtonTypeEnum.usual, DigitButtonTypeEnum.usual,
    DigitButtonTypeEnum.usual, DigitButtonTypeEnum.usual, DigitButtonTypeEnum.usual,
    DigitButtonTypeEnum.usual, DigitButtonTypeEnum.usual, DigitButtonTypeEnum.usual,
    DigitButtonTypeEnum.usual]
  );
  ObservableList<String> currentUserInput = ObservableList.of([" ", " ", " ", " "]);
  ObservableList<GameTurn> turnHistory = ObservableList();
  ObservableList<int> markedDigits = ObservableList();
  
  @action
  void makeTurn() {
    var intValues = currentUserInput.map(
      (element) => int.parse(element)
    ).toList();
    
    turnHistory.add(_turnAnalyzer.analyzeTurn(intValues, _computerSecret));
    currentUserInput.setAll(0, [" ", " ", " ", " "]);
  }

  @action
  void toggleDigitMark(int digit) {
    if (markedDigits.contains(digit)) {
      markedDigits.remove(digit);
    } else {
      markedDigits.add(digit);
    }
  }

  @action
  void switchInputMode() {
    inputMode.value = (inputMode.value == UserInputModeEnum.usualInput)
      ? UserInputModeEnum.markDigitsInput
      : UserInputModeEnum.usualInput;
  }

  @action
  void backspace() {
    currentUserInputIndex.value--;
    if (currentUserInputIndex.value < 0) {
      currentUserInputIndex.value = currentUserInput.length - 1;
    }
    currentUserInput[currentUserInputIndex.value] = " ";
  }

  @action
  void digitButtonTap(int digit) {
    if (inputMode.value == UserInputModeEnum.markDigitsInput) {
      toggleDigitMark(digit);
    } else {
      setNumberForCurrentPlace(digit);
    }
  }

  void setNumberForCurrentPlace(int number) {
    int index = currentUserInput.indexOf(number.toString());
    if (index != -1) {
      currentUserInput[index] = " ";
    }
    currentUserInput[currentUserInputIndex.value] = number.toString();
    currentUserInputIndex.value++;
    if (currentUserInputIndex.value >= currentUserInput.length) {
      currentUserInputIndex.value = 0;
    }    
  }

  bool isDigitMarked(int digit) {
    return markedDigits.contains(digit);
  }
  
  void dispose() {
    
  }
}