import 'package:chess_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'board_model.dart';
import 'board_rank.dart';
import 'chess_board_controller.dart';

var whiteSquareList = [
  [
    "a8",
    "b8",
    "c8",
    "d8",
    "e8",
    "f8",
    "g8",
    "h8",
  ],
  [
    "a7",
    "b7",
    "c7",
    "d7",
    "e7",
    "f7",
    "g7",
    "h7",
  ],
  [
    "a6",
    "b6",
    "c6",
    "d6",
    "e6",
    "f6",
    "g6",
    "h6",
  ],
  [
    "a5",
    "b5",
    "c5",
    "d5",
    "e5",
    "f5",
    "g5",
    "h5",
  ],
  [
    "a4",
    "b4",
    "c4",
    "d4",
    "e4",
    "f4",
    "g4",
    "h4",
  ],
  [
    "a3",
    "b3",
    "c3",
    "d3",
    "e3",
    "f3",
    "g3",
    "h3",
  ],
  [
    "a2",
    "b2",
    "c2",
    "d2",
    "e2",
    "f2",
    "g2",
    "h2",
  ],
  [
    "a1",
    "b1",
    "c1",
    "d1",
    "e1",
    "f1",
    "g1",
    "h1",
  ],
];

/// Enum which stores board types
enum BoardType {
  brown,
  darkBrown,
  orange,
  green,
}

/// The Chessboard Widget
class ChessBoard extends StatefulWidget {
  /// Size of chessboard
  final double size;

  /// Callback for when move is made
  final MoveCallback onMove;

  /// Callback for when a player is checkmated
  final CheckMateCallback onCheckMate;

  /// Callback for when a player is in check
  final CheckCallback onCheck;

  /// Callback for when the game is a draw
  final VoidCallback onDraw;

  /// A boolean which notes if white board side is towards users
  final bool whiteSideTowardsUser;

  /// A controller to programmatically control the chess board
  final ChessBoardController chessBoardController;

  /// A boolean which checks if the user should be allowed to make moves
  final bool enableUserMoves;

  /// The color type of the board
  final BoardType boardType;

  ChessBoard({
    this.size = 200.0,
    this.whiteSideTowardsUser = true,
    @required this.onMove,
    @required this.onCheckMate,
    @required this.onCheck,
    @required this.onDraw,
    this.chessBoardController,
    this.enableUserMoves = true,
    this.boardType = BoardType.brown,
  });

  @override
  _ChessBoardState createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: BoardModel(
        widget.size,
        widget.onMove,
        widget.onCheckMate,
        widget.onCheck,
        widget.onDraw,
        widget.whiteSideTowardsUser,
        widget.chessBoardController,
        widget.enableUserMoves,
      ),
      child: ScopedModelDescendant<BoardModel>(builder: (context, _, model) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  height: 100,
                  width: 150,
                  child: GridView.count(
                    crossAxisCount: 6,
                    children: List.generate(model.whitePiecesCaptured.length,
                            (index) => model.whitePiecesCaptured[index]),
                  ),
                ),
                timerContainer(model.blackCounter.toString(), Colors.orange[900]),
                Container(
                  height: 100,
                  width: 150,
                ),
              ],
            ),
            Text(
              'Player 2',
              style: TextStyle(fontSize: 18),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  border: Border.all(width: 15.0, color: Color(0xFF8C5415))),
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: widget.size,
                width: widget.size,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: widget.size,
                      width: widget.size,
                      child: _getBoardImage(),
                    ),
                    //Overlaying draggables/ dragTargets onto the squares
                    Center(
                      child: Container(
                        height: widget.size,
                        width: widget.size,
                        child: buildChessBoard(),
                      ),
                    ),
                    IgnorePointer(
                      child: ScopedModelDescendant<BoardModel>(
                        builder: (context, _, model) {
                          return Container(
                            //color: Colors.blueGrey.withOpacity(0.4),
                            height: widget.size,
                            width: widget.size,
                            child: GridView.count(
                              scrollDirection: Axis.horizontal,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 8,
                              mainAxisSpacing:
                                  MediaQuery.of(context).size.width >= 400
                                      ? 1.82
                                      : 1.0,
                              crossAxisSpacing: 1,
                              children: List.generate(64, (index) {
                                if (model.possibleMoves.contains(index) &&
                                    model.isCLicked) {
                                  return Container(
                                    height: widget.size / 8,
                                    width: widget.size / 8,
                                    child: Center(
                                      child: CircleAvatar(
                                        radius: 6,
                                        backgroundColor:
                                            Colors.black.withOpacity(0.4),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    height: widget.size / 8,
                                    width: widget.size / 8,
                                    child: Center(
                                      child: CircleAvatar(
                                        radius: 6,
                                        backgroundColor: Colors.transparent,
                                      ),
                                    ),
                                  );
                                }
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 150,
                  child: GridView.count(
                    crossAxisCount: 6,
                    children: List.generate(model.blackPiecesCaptured.length,
                        (index) => model.blackPiecesCaptured[index]),
                  ),
                ),
                timerContainer(model.whiteCounter.toString(), Colors.blue),
                Container(
                  height: 100,
                  width: 150,
                ),
              ],
            ),
            Text(
              'Player 1',
              style: TextStyle(fontSize: 18),
            ),
            TextButton(
              onPressed: () {
                if (model.buttonText == 'HINT') {
                  model.hintSquare(model.game.moves().first);
                } else {
                  counterMove = 0;
                  model.hintOrStart();
                  model.startTimer();
                }
              },
              child: hintButton(model.buttonText),
            )
          ],
        );
      }),
    );
  }

  /// Builds the board
  Widget buildChessBoard() {
    return Column(
      children: widget.whiteSideTowardsUser
          ? whiteSquareList.map((row) {
              return ChessBoardRank(
                children: row,
              );
            }).toList()
          : whiteSquareList.reversed.map((row) {
              return ChessBoardRank(
                children: row.reversed.toList(),
              );
            }).toList(),
    );
  }

  /// Returns the board image
  Image _getBoardImage() {
    switch (widget.boardType) {
      case BoardType.brown:
        return Image.asset(
          "assets/images/chess_board_2.png",
          fit: BoxFit.cover,
        );
      case BoardType.darkBrown:
        return Image.asset(
          "images/dark_brown_board.png",
          package: 'flutter_chess_board',
          fit: BoxFit.cover,
        );
      case BoardType.green:
        return Image.asset(
          "images/green_board.png",
          package: 'flutter_chess_board',
          fit: BoxFit.cover,
        );
      case BoardType.orange:
        return Image.asset(
          "images/orange_board.png",
          package: 'flutter_chess_board',
          fit: BoxFit.cover,
        );
      default:
        return null;
    }
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
