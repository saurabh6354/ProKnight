import 'package:flutter/material.dart';

class RouletteScore extends StatelessWidget {
  final dynamic selected;

  final Map<dynamic, String> labels = {
    1: '100\♞',
    2: '300\♞',
    3: '500\♞',
    4: '700\♞',
    5: '900\♞',
    6: '1200\♞',
    7: '2000\♞',
    8: '5000\♞',
  };


  RouletteScore(this.selected);

  @override
  Widget build(BuildContext context) {
    return Text('${labels[selected]} ',
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 28.0));
  }
}