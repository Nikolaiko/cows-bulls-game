import 'package:cows_bulls_game/mobX/single_player_game_store.dart';
import 'package:cows_bulls_game/services/game_turn_analyzer.dart';
import 'package:cows_bulls_game/services/random_sequnce_generator.dart';
import 'package:cows_bulls_game/single_player_game/single_player_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleGameInitializer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<SinglePlayerGameStore>(
      create: (builderContext) {
        return SinglePlayerGameStore.create(
          RandomSequnceGenerator(),
          GameTurnAnalyzer()
        );
      },
      dispose: (_, value) => value.dispose(),
      child: SinglePlayerScreenWidget(),
    );
  }
}