import 'package:cows_bulls_game/model/game_turn.dart';
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
  ObservableList<String> currentUserInput = ObservableList.of([" ", " ", " ", " "]);
  ObservableList<GameTurn>  turnHistory = ObservableList();
  
  @action
  void makeTurn() {
    var intValues = currentUserInput.map(
      (element) => int.parse(element)
    ).toList();
    
    turnHistory.add(_turnAnalyzer.analyzeTurn(intValues, _computerSecret));
    currentUserInput.setAll(0, [" ", " ", " ", " "]);
  }

  @action
  void backspace() {
    currentUserInputIndex.value--;
    if (currentUserInputIndex.value < 0) {
      currentUserInputIndex.value = currentUserInput.length - 1;
    }
  }

  @action
  void setNumberForCurrentPlace(int number) {
    currentUserInput[currentUserInputIndex.value] = number.toString();
    currentUserInputIndex.value++;
    if (currentUserInputIndex.value >= currentUserInput.length) {
      currentUserInputIndex.value = 0;
    }    
  }

  void dispose() {
    
  }
}