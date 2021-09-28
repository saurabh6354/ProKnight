import 'package:chess_app/chessBoard/boardProvider/move_provider.dart';
import 'package:chess_app/chessBoard/chess_board_controller.dart';
import 'package:flutter/material.dart';
import 'package:chess_app/chessBoard/chess_board.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:chess_app/spinning_wheel/setting.dart';
import '../../constant.dart';

class PWFOffline extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _chessController = ChessBoardController();
    final read = context.read<MoveProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: IconButton(
            onPressed: () {
              print("Container clicked");
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => setting()));
            },
            icon: Icon(
              Icons.settings_outlined,
              color: Colors.black,
              size: 30,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.refresh,
                color: Colors.black,
                size: 30,
              )),
        ],
      ),
      body: Container(
        height: ScreenSize().height(context),
        width: ScreenSize().width(context),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.yellow[100]],
            )
        ),
        child: ChessBoard(
          size: MediaQuery.of(context).size.width >= 400
              ? 400
              : 350,
          onMove: (covariant) {
            print("moved");
          },
          onCheckMate: (pieceColor) {
            String text;
            if (pieceColor.toString() == "PieceColor.black") {
              text = "Black Won";
            } else {
              text = "White won";
            }
            read.changeColor();
            print(pieceColor.toString());
            showPlatformDialog(
              context: context,
              builder: (_) => BasicDialogAlert(
                title: Text("CHECK MATE"),
                content: Text(text),
                actions: <Widget>[
                  BasicDialogAction(
                    title: Text("RESET"),
                    onPressed: () {
                      Navigator.pop(context);
                      read.changeColor();
                    },
                  ),
                ],
              ),
            );
          },
          onCheck: (pieceColor) {
            if (pieceColor.toString() == "") {}
          },
          onDraw: () {},
          chessBoardController: _chessController,
        ),
      ),
    );
  }

  Widget hintButton(String text) {
    return Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget timerContainer(timer, color) {
    return Container(
      height: 100,
      width: 100,
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.orange[800]),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // add this
          children: <Widget>[
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(
                'assets/images/playerProfile.jpg',
                // width: 300,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    color: color),
                child: Center(
                    child: Text(
                  timer,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}