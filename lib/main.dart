import 'package:cows_bulls_game/ai/AI.dart';
import 'package:cows_bulls_game/consts/app_colors.dart';
import 'package:cows_bulls_game/consts/app_consts.dart';
import 'package:cows_bulls_game/main_screen/main_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

void main() {

  AI.initAllCombinations();
  mainContext.config = ReactiveConfig.main.clone(
    writePolicy: ReactiveWritePolicy.always,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConsts.APP_NAME,
      theme: ThemeData(
        primarySwatch: navBarColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),      
      home: MainScreenWidget(),
    );
  }
}
