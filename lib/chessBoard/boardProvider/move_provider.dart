import 'dart:async';
import 'package:chess_app/constant.dart';
import 'package:flutter/material.dart';

String move;
List<String> moveHistory = [];

void getMove(){

}

class MoveProvider with ChangeNotifier {
  // define variables here
  bool _isSelected = false; // to check if the piece is selected or not
  int _loc = 0;
  Color _color = Colors.transparent;

  // to return the value of selected
  bool get selected => _isSelected;
  int get location => _loc;
  Color get color => _color;

  void pieceClicked(String piecePosition, String color){
    _isSelected = !_isSelected;
    print(piecePosition);
    print(color);
    _getLocation(piecePosition[0], piecePosition[1]);
    print(_loc);
    notifyListeners();
  }

  // to get the variable equivalent location of piece
  void _getLocation(String index_0, String index_1){
    int r = 0;
    int c = 0;

    c = index_0.codeUnitAt(0) - 'a'.codeUnitAt(0);
    r = int.parse(index_1);
    c+=1;
    print("c = $c and r = $r");

    _loc = c*8 - r;
  }

  void changeColor(){
    if(_color == Colors.transparent){
      _color = Colors.red;
    } else{
      _color = Colors.transparent;
    }
    notifyListeners();
  }

  int _whiteCounter = 60;
  int _blackCounter = 60;
  Timer _timer;

  int get whiteCounter => _whiteCounter;

  int get blackCounter => _blackCounter;

  void startTimer() {
    _whiteCounter = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_whiteCounter > 0 && _blackCounter > 0) {
        if (counterMove % 2 == 0) {
          _whiteCounter--;
        } else {
          _blackCounter--;
        }
      } else {
        _timer.cancel();
      }
      notifyListeners();
    });
  }

  String _buttonText = 'START';

  String get buttonText => _buttonText;

  void hintOrStart(){
    if(_buttonText == 'START'){
      _buttonText = 'HINT';
      notifyListeners();
    }
  }
}