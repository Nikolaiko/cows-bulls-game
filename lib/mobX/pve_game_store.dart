import 'package:cows_bulls_game/ai/AI.dart';
import 'package:cows_bulls_game/services/abstract/blind_guess_analyzer.dart';
import 'package:cows_bulls_game/services/abstract/random_generator.dart';
import 'package:cows_bulls_game/services/abstract/turn_analyzer.dart';
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

  Observable<bool> gameCompleted = Observable(false);

  List<int> _computerSecret = [];

  
  @action
  void resetGame() {
    
  }

  void dispose() {}
}