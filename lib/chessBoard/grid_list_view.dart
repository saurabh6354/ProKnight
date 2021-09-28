import 'package:flutter/material.dart';

class GridListView{

  List<Widget> singleRow = [

  ];

  List<List<Widget>> squaredBox = [
    [
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
    ],
    [StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),],
    [StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),],
    [StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),],
    [StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),],
    [StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),],
    [StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),],
    [StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),
      StepsCircle(),],
  ];

}

class StepsCircle extends StatelessWidget {

  StepsCircle({ this.colorValue=false});

  final bool colorValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 400/8,
        width: 410/8,
        color: Colors.red.withOpacity(0.4),
        child: Center(
          child: CircleAvatar(
            radius: 8,
          ),
        ),
      ),
    );
  }
}