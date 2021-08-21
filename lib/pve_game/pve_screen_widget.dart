import 'package:cows_bulls_game/consts/app_consts.dart';
import 'package:cows_bulls_game/pve_game/pve_ui_widget.dart';
import 'package:flutter/material.dart';

class PveScreenWidget extends StatelessWidget {
  const PveScreenWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppConsts.APP_NAME)),
      body: SafeArea(
        child: Container(
          child: Column(            
            children: [              
              PveUIWidget()
            ]
          ),
        ),
      ),
    );
  }
}