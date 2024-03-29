import 'package:cows_bulls_game/mobX/pve_game_store.dart';
import 'package:cows_bulls_game/ui/pve_game/pve_screen_widget.dart';
import 'package:cows_bulls_game/services/random_sequnce_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PveGameInitializer extends StatelessWidget {
  const PveGameInitializer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<PveGameStore>(      
      create: (builderContext) {
        return PveGameStore.create(
          RandomSequnceGenerator()
        );
      },
      dispose: (_, value) => value.dispose(),
      child: PveScreenWidget(),
    );
  }
}