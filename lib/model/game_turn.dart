import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_turn.freezed.dart';

@freezed
abstract class GameTurn with _$GameTurn {
  const factory GameTurn(
    List<int> turnValues,
    int cows,
    int bulls
  ) = _GameTurn;
}