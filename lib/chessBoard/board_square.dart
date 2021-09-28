import 'package:chess_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:chess/chess.dart' as chess;

import 'boardProvider/move_provider.dart';
import 'board_model.dart';

Color bgColor = Colors.transparent;
Color blackKingBg = Colors.transparent;

/// A single square on the chessboard
class BoardSquare extends StatelessWidget {
  /// The square name (a2, d3, e4, etc.)
  final squareName;

  BoardSquare({this.squareName});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<BoardModel>(builder: (context, _, model) {
      return Expanded(
        flex: 1,
        child: DragTarget(builder: (context, accepted, rejected) {
          return model.game.get(squareName) != null
              ? Draggable(
                  onDragStarted: () {
                    String color;
                    if(model.game.get(squareName).color.toString() == "Color.WHITE"){
                      color = 'w';
                    } else{
                      color = 'b';
                    }
                    print(model.game.ascii);
                    print(model.game.get(squareName).type);
                    print(model.game.fen);
                    print(model.game.pgn());
                    model.pieceTouched(squareName,  model.game.get(squareName).type.toString(), color);
                  },
            onDragUpdate: (details){
                    model.isSelected();
            },
            onDragEnd: (details){
                    //print("History == ${model.game.getHistory()}");
                    List<dynamic> gameHistory = model.game.getHistory();
                    print("games hist ory = $gameHistory");
                    if(gameHistory.length > model.historyLength) {
                      counterMove++;
                      model.increaseLength();
                      print(gameHistory[gameHistory.length - 1]);
                      model.moveHistory(gameHistory[gameHistory.length - 1].toString());

                      String move = gameHistory[gameHistory.length -1];

                      if(move[1] == 'x'){
                        String mv = move[2] + move[3];
                        String pieceInfo;
                        for(int i = 0; i<gameHistory.length - 1 ; i++){
                          if(gameHistory[i].contains(mv)){
                            if(gameHistory[i].length > 2){
                              pieceInfo = gameHistory[i][0].toLowerCase();
                              if(gameHistory.length%2 == 0)
                                pieceInfo+='w';
                              else
                                pieceInfo+='b';
                            } else{
                              pieceInfo = 'p';
                              if(gameHistory.length%2 == 0)
                                pieceInfo+='w';
                              else
                                pieceInfo+='b';
                            }
                          }
                          if(pieceInfo != null){
                            model.pieceCaptured(pieceInfo);
                            break;
                          }
                        }
                      }
                    }
            },
                  child: _getImageToDisplay(size: model.size / 8, model: model),
                  feedback: _getImageToDisplay(
                      size: (1.2 * (model.size / 8)), model: model),
                  onDragCompleted: () {},
                  data: [
                    squareName,
                    model.game.get(squareName).type.toUpperCase(),
                    model.game.get(squareName).color,
                  ],
                )
              : Container();
        }, onWillAccept: (willAccept) {
          return model.enableUserMoves ? true : false;
        }, onAccept: (List moveInfo) async {
          // A way to check if move occurred.
          chess.Color moveColor = model.game.turn;

          if (moveInfo[1] == "P" &&
              ((moveInfo[0][1] == "7" &&
                      squareName[1] == "8" &&
                      moveInfo[2] == chess.Color.WHITE) ||
                  (moveInfo[0][1] == "2" &&
                      squareName[1] == "1" &&
                      moveInfo[2] == chess.Color.BLACK))) {
            var val = await _promotionDialog(context);

            if (val != null) {
              model.game.move(
                  {"from": moveInfo[0], "to": squareName, "promotion": val});
              print("move info == $moveInfo");
            } else {
              return;
            }
          } else {
            model.game.move({"from": moveInfo[0], "to": squareName});
          }
          if (model.game.turn != moveColor) {
            model.onMove(
                moveInfo[1] == "P" ? squareName : moveInfo[1] + squareName);
          }
          model.refreshBoard();
        }),
      );
    });
  }

  /// Show dialog when pawn reaches last square
  Future<String> _promotionDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Choose promotion'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                child: WhiteQueen(),
                onTap: () {
                  Navigator.of(context).pop("q");
                },
              ),
              InkWell(
                child: WhiteRook(),
                onTap: () {
                  Navigator.of(context).pop("r");
                },
              ),
              InkWell(
                child: WhiteBishop(),
                onTap: () {
                  Navigator.of(context).pop("b");
                },
              ),
              InkWell(
                child: WhiteKnight(),
                onTap: () {
                  Navigator.of(context).pop("n");
                },
              ),
            ],
          ),
        );
      },
    ).then((value) {
      return value;
    });
  }

  /// Get image to display on square
  Widget _getImageToDisplay({double size, BoardModel model}) {
    Widget imageToDisplay = Container();

    if (model.game.get(squareName) == null) {
      return Container();
    }

    String piece =
        (model.game.get(squareName).color == chess.Color.WHITE ? 'W' : 'B') +
            model.game.get(squareName).type.toUpperCase();

    switch (piece) {
      case "WP":
        imageToDisplay = PieceContainer(
          path: 'soldier_w.png',
          squarePosition: this.squareName,
        );
        break;
      case "WR":
        imageToDisplay = PieceContainer(
          path: 'elephant_w.png',
          squarePosition: this.squareName,
        );
        break;
      case "WN":
        imageToDisplay = PieceContainer(
          path: 'horse_w.png',
          squarePosition: this.squareName,
        );
        break;
      case "WB":
        imageToDisplay = PieceContainer(
          path: 'camel_w.png',
          squarePosition: this.squareName,
        );
        break;
      case "WQ":
        imageToDisplay = PieceContainer(
          path: 'queen_w.png',
          squarePosition: this.squareName,
        );
        break;
      case "WK":
        imageToDisplay = PieceContainer(
          path: 'king_w.png',
          squarePosition: this.squareName,
        );
        break;
      case "BP":
        imageToDisplay = PieceContainer(
          path: 'soldier_b.png',
          squarePosition: this.squareName,
        );
        break;
      case "BR":
        imageToDisplay = PieceContainer(
          path: 'elephant_b.png',
          squarePosition: this.squareName,
        );
        break;
      case "BN":
        imageToDisplay = PieceContainer(
          path: 'horse_b.png',
          squarePosition: this.squareName,
        );
        break;
      case "BB":
        imageToDisplay = PieceContainer(
          path: 'camel_b.png',
          squarePosition: this.squareName,
        );
        break;
      case "BQ":
        imageToDisplay = PieceContainer(
          path: 'queen_b.png',
          squarePosition: this.squareName,
        );
        break;
      case "BK":
        imageToDisplay = PieceContainer(
          path: 'b_king.png',
          squarePosition: this.squareName,
          isBlacking: true,
        );
        break;
      default:
        imageToDisplay = WhitePawn(size: size);
    }

    return imageToDisplay;
  }
}

class PieceContainer extends StatelessWidget {
  PieceContainer(
      {@required this.path,
      @required this.squarePosition,
      this.isBlacking = false});

  final String path;
  final double size = 40.0;
  final String squarePosition;
  final bool isBlacking;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: isBlacking ? context.watch<MoveProvider>().color : bgColor,
      height: (path == 'soldier_b.png' || path == 'soldier_w.png')? size : size + 10,
      width: size,
      child: Image.asset('assets/images/$path'),
    );
  }
}
