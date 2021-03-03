import 'package:flutter/material.dart';

class KeyboardWidget extends StatefulWidget {
  @override
  _KeyboardWidgetState createState() => _KeyboardWidgetState();
}

class _KeyboardWidgetState extends State<KeyboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(flex: 6, child: Container(color: Colors.purple),),
        Flexible(flex: 2, child: Container(color: Colors.black26),)
      ]
    );
  }
}