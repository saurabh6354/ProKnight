import 'package:chess_app/constant.dart';
import 'package:flutter/material.dart';

class ChessBoard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double screenHeight = ScreenSize().height(context);
    final double screenWidth = ScreenSize().width(context);
    return Scaffold(
      body: Center(
        child: Container(
          height: screenHeight*0.6,
          width: screenWidth*0.98,
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              ChessRowTwo(),
              ChessRowOne(),
              ChessRowTwo(),
              ChessRowOne(),
              ChessRowTwo(),
              ChessRowOne(),
              ChessRowTwo(),
              ChessRowOne(),
            ],
          ),
        ),
      ),
    );
  }
}

class ChessRowOne extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double screenHeight = ScreenSize().height(context);
    final double screenWidth = ScreenSize().width(context);
    return Container(
      height: (screenHeight*0.5)/8,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        children: [
          DarkSquare(),
          LightSquare(),
          DarkSquare(),
          LightSquare(),
          DarkSquare(),
          LightSquare(),
          DarkSquare(),
          LightSquare(),
        ],
      ),
    );
  }
}


class ChessRowTwo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double screenHeight = ScreenSize().height(context);
    final double screenWidth = ScreenSize().width(context);
    return Container(
      height: (screenHeight*0.5)/8,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        children: [
          LightSquare(),
          DarkSquare(),
          LightSquare(),
          DarkSquare(),
          LightSquare(),
          DarkSquare(),
          LightSquare(),
          DarkSquare(),
        ],
      ),
    );
  }
}


class DarkSquare extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double screenHeight = ScreenSize().height(context);
    final double screenWidth = ScreenSize().width(context);
    return Container(
      height: (screenHeight*0.5)/8,
      width: (screenWidth)/8,
      color: Color(0xFF644731),
    );
  }
}

class LightSquare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = ScreenSize().height(context);
    final double screenWidth = ScreenSize().width(context);
    return Container(
      height: (screenHeight*0.5)/8,
      width: (screenWidth*0.98)/8,
      color: Color(0xFFBA9D78),
    );
  }
}

