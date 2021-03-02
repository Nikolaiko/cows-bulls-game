import 'package:cows_bulls_game/model/game_turn.dart';
import 'package:cows_bulls_game/services/abstract/random_generator.dart';
import 'package:mobx/mobx.dart';

part 'single_player_game_store.g.dart';

class _SinglePlayerGameStore extends SinglePlayerGameStore with _$_SinglePlayerGameStore {
  _SinglePlayerGameStore(RandomGenerator generator) : super(generator);
}

abstract class SinglePlayerGameStore with Store {
  factory SinglePlayerGameStore.create(
    RandomGenerator generator
  ) => _SinglePlayerGameStore(generator);

  final RandomGenerator _randomGenerator;  

  SinglePlayerGameStore(this._randomGenerator) {
    _computerSecret = _randomGenerator.generateSequnce();
  }

  List<int> _computerSecret = [];
  ObservableList<GameTurn>  turnHistory = ObservableList();
  

  @action
  void makeTurn(List<int> turnValues) {
    
  }


}