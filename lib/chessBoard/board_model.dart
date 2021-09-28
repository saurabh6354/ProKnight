import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:chess/chess.dart' as chess;
import '../constant.dart';
import 'chess_board_controller.dart';

typedef Null MoveCallback(String moveNotation);
typedef Null CheckMateCallback(PieceColor color);
typedef Null CheckCallback(PieceColor color);

class BoardModel extends Model {
  /// The size of the board (The board is a square)
  double size;

  /// Callback for when a move is made
  MoveCallback onMove;

  /// Callback for when a player is checkmated
  CheckMateCallback onCheckMate;

  ///Callback for when a player is in check
  CheckCallback onCheck;

  /// Callback for when the game is a draw (Example: K v K)
  VoidCallback onDraw;

  /// If the white side of the board is towards the user
  bool whiteSideTowardsUser;

  /// The controller for programmatically making moves
  ChessBoardController chessBoardController;

  /// User moves can be enabled or disabled by this property
  bool enableUserMoves;

  /// Creates a logical game
  chess.Chess game = chess.Chess();

  /// to check if the piece is clicked or not
  bool _isClicked = false;

  /// to get the location of the chess pieces
  int _loc = 0;

  int _historyLength = 0;

  List<int> _possibleMoves = [];
  List<int> _moveMade = [];

  // This list contains all the history
  // of possible moves initially it is given
  // default chess square numbers
  List<int> _positionHistory = [
    0,
    8,
    16,
    24,
    32,
    40,
    48,
    56,
    1,
    9,
    17,
    25,
    33,
    41,
    49,
    57,
    6,
    14,
    22,
    30,
    38,
    46,
    54,
    62,
    7,
    15,
    23,
    31,
    39,
    47,
    55,
    63
  ];

  // List<int> _whiteInitialPawnPosition = [6, 14, 22, 30, 38, 46, 54, 62];
  //
  // List<int> _blackInitialPawnPosition = [1, 9, 17, 25, 33, 41, 49, 57];

  String _color;

  Color bgColor;

  bool get isCLicked => _isClicked;

  int get historyLength => _historyLength;

  List<int> get possibleMoves => _possibleMoves;

  List<Widget> _whitePiecesCaptured = [];
  List<Widget> _blackPiecesCaptured = [];

  void increaseLength() {
    _historyLength += 1;
  }

  /// this function gives the current location of the chess piece
  int returnPosition(String position) {
    int r = 0;
    int c = 0;

    print("POSITION = $position");
    if (position == 'O-O-O') {
      if (_color == 'w') {
        _positionHistory.remove(7);
        _positionHistory.remove(39);

        _positionHistory.add(31);
        _positionHistory.add(23);
      } else if (_color == 'b') {
        _positionHistory.remove(32);
        _positionHistory.remove(0);

        _positionHistory.add(16);
        _positionHistory.add(24);
      }
    } else if (position == 'O-O') {
      if (_color == 'w') {
        _positionHistory.remove(63);
        _positionHistory.remove(39);

        _positionHistory.add(55);
        _positionHistory.add(47);
      } else if (_color == 'b') {
        _positionHistory.remove(32);
        _positionHistory.remove(56);

        _positionHistory.add(40);
        _positionHistory.add(48);
      }
    } else if (position.length > 2 && position[position.length - 1] != '+') {
      print("2 > $position");
      c = position[1].codeUnitAt(0) - 'a'.codeUnitAt(0);
      r = int.parse(position[position.length - 1]);
    } else if (position.length > 2 && position[position.length - 1] == '+') {
      r = int.parse(position[position.length - 2]);
    } else {
      c = position[0].codeUnitAt(0) - 'a'.codeUnitAt(0);
      r = int.parse(position[position.length - 1]);
    }

    c += 1;

    return (c * 8 - r);
  }

  /// to check if the chess piece is selected or not
  void isSelected() {
    if (_isClicked) {
      _isClicked = false;
    } else{

    }
  }

  // to get the history of the moves
  void moveHistory(String position) {
    _moveMade.add(returnPosition(position));
    if (_moveMade[1] != _moveMade[0]) {
      _positionHistory.remove(_moveMade[0]);
      _positionHistory.add(_moveMade[1]);
    }
  }

  /// Refreshes board
  void refreshBoard() {
    if (game.in_checkmate) {
      onCheckMate(
          game.turn == chess.Color.WHITE ? PieceColor.White : PieceColor.Black);
    } else if (game.in_draw ||
        game.in_stalemate ||
        game.in_threefold_repetition ||
        game.insufficient_material) {
      onDraw();
    } else if (game.in_check) {
      onCheck(
          game.turn == chess.Color.WHITE ? PieceColor.White : PieceColor.Black);
    }
    notifyListeners();
  }

  /// to check if the chess piece is touched or not
  void pieceTouched(String position, String pieceType, String color) {
    _isClicked = !_isClicked;

    _color = color;

    pieceType = pieceType + color;
    print("pieceType = $pieceType");

    int i = int.parse(position[1]) - 1;
    int j = position[0].codeUnitAt(0) - 'a'.codeUnitAt(0);

    print("i = $i and j = $j");

    _loc = returnPosition(position);

    print("location = $_loc");

    _moveMade = [];
    _possibleMoves = [];

    _moveMade.add(_loc);

    print(pieceType);

    // switch case to know which piece type it is
    switch (pieceType) {
      case 'pw':
        legalWhitePawnMoves(position);
        break;
      case 'pb':
        legalBlackPawnMoves(position);
        break;
      case 'nw':
        legalKnightMoves(position);
        break;
      case 'nb':
        legalKnightMoves(position);
        break;
      case 'kw':
        legalKingMoves(position);
        break;
      case 'kb':
        legalKingMoves(position);
        break;
      case 'bw':
        legalBishopMoves(position);
        break;
      case 'bb':
        legalBishopMoves(position);
        break;
      case 'rw':
        legalRookMoves(position);
        break;
      case 'rb':
        legalRookMoves(position);
        break;
      case 'qw':
        legalRookMoves(position);
        legalBishopMoves(position);
        break;
      case 'qb':
        legalRookMoves(position);
        legalBishopMoves(position);
        break;
    }
    print(_possibleMoves);
    notifyListeners();
  }

  BoardModel(
      this.size,
      this.onMove,
      this.onCheckMate,
      this.onCheck,
      this.onDraw,
      this.whiteSideTowardsUser,
      this.chessBoardController,
      this.enableUserMoves) {
    chessBoardController?.game = game;
    chessBoardController?.refreshBoard = refreshBoard;
  }

  /// to add the legal moves into the list
  void addToLegalListMoves(List<int> moves) {
    for (int i = 0; i < moves.length; i++) {
      if (!(_positionHistory.contains(moves[i]))) _possibleMoves.add(moves[i]);
    }
  }

  /*
      This is the start of the piece move logic
      it contains all the logic a piece would use to
      move on the chess board
   */
  void legalKnightMoves(String position) {
    /// remember i starts from 1-8
    /// and j goes from 1-8 inclusive of the number

    int i = int.parse(position[1]);
    int j = position[0].codeUnitAt(0) - 'a'.codeUnitAt(0) + 1;

    print("i = $i and j = $j");

    int location = 8 * j - i;

    print("location = $location");

    List<int> moves = [];

    if (i + 2 <= 8) {
      if (j - 1 > 0) moves.add(8 * (j - 1) - (i + 2));
      if (j + 1 <= 8) moves.add(8 * (j + 1) - (i + 2));
      print("moves = $moves");
    }

    if (i - 2 > 0) {
      if (j - 1 > 0) moves.add(8 * (j - 1) - (i - 2));
      if (j + 1 <= 8) moves.add(8 * (j + 1) - (i - 2));
      print("ij moves = $moves");
    }

    if (j - 2 > 0) {
      if (i - 1 > 0) moves.add(8 * (j - 2) - (i - 1));
      if (i + 1 <= 8) moves.add(8 * (j - 2) - (i + 1));
      print("moves = $moves");
    }

    if (j + 2 <= 8) {
      if (i - 1 > 0) moves.add(8 * (j + 2) - (i - 1));
      if (i + 1 <= 8) moves.add(8 * (j + 2) - (i + 1));
      print("moves = $moves");
    }

    addToLegalListMoves(moves);
  }

  void legalWhitePawnMoves(String position) {
    int i = int.parse(position[1]);
    int j = position[0].codeUnitAt(0) - 'a'.codeUnitAt(0) + 1;

    List<int> moves = [];

    if (i == 2) {
      moves.add(8 * j - (i + 2));
      moves.add(8 * j - (i + 1));
    } else if (i + 1 <= 8) {
      moves.add(8 * j - (i + 1));
    }
    print("White pawn moves = $moves");

    addToLegalListMoves(moves);
  }

  void legalBlackPawnMoves(String position) {
    int i = int.parse(position[1]);
    int j = position[0].codeUnitAt(0) - 'a'.codeUnitAt(0) + 1;

    List<int> moves = [];

    if (i == 7) {
      moves.add(8 * j - (i - 2));
      moves.add(8 * j - (i - 1));
    } else {
      moves.add(8 * j - (i - 1));
    }

    print("Black pawn moves = $moves");

    addToLegalListMoves(moves);
  }

  void legalKingMoves(String position) {
    int i = int.parse(position[1]);
    int j = position[0].codeUnitAt(0) - 'a'.codeUnitAt(0) + 1;

    List<int> moves = [];

    if (i - 1 > 0) {
      moves.add(8 * j - (i - 1));
      if (j - 1 > 0) {
        moves.add(8 * (j - 1) - i);
        moves.add(8 * (j - 1) - (i - 1));
      }
      if (j + 1 <= 8) {
        moves.add(8 * (j + 1) - i);
        moves.add(8 * (j + 1) - (i - 1));
      }
    }

    if (i + 1 <= 8) {
      moves.add(8 * j - (i + 1));
      if (j - 1 > 0) {
        moves.add(8 * (j - 1) - i);
        moves.add(8 * (j - 1) - (i + 1));
      }
      if (j + 1 <= 8) {
        moves.add(8 * (j + 1) - i);
        moves.add(8 * (j + 1) - (i + 1));
      }
    }

    addToLegalListMoves(moves);
  }

  void legalBishopMoves(String position) {
    int i = int.parse(position[1]);
    int j = position[0].codeUnitAt(0) - 'a'.codeUnitAt(0) + 1;

    List<int> moves = [];

    if (!(_positionHistory.contains(8 * (j + 1) - (i + 1)))) {
      int k = i + 1;
      int l = j + 1;
      while (k <= 8 && l <= 8) {
        moves.add(8 * l - k);
        k++;
        l++;
        if (_positionHistory.contains(8 * l - k)) {
          break;
        }
      }
    }

    if (!(_positionHistory.contains(8 * (j - 1) - (i + 1)))) {
      int k = i + 1;
      int l = j - 1;

      while (k <= 8 && l > 0) {
        moves.add(8 * l - k);
        k++;
        l--;
        if (_positionHistory.contains(8 * l - k)) {
          break;
        }
      }
    }

    if (!(_positionHistory.contains(8 * (j - 1) - (i - 1)))) {
      int k = i - 1;
      int l = j - 1;

      while (k > 0 && l > 0) {
        moves.add(8 * l - k);
        k--;
        l--;
        if (_positionHistory.contains(8 * l - k)) {
          break;
        }
      }
    }

    if (!(_positionHistory.contains(8 * (j + 1) - (i - 1)))) {
      int k = i - 1;
      int l = j + 1;

      while (k > 0 && l > 0) {
        moves.add(8 * l - k);
        k--;
        l++;
        if (_positionHistory.contains(8 * l - k)) {
          break;
        }
      }
    }
    addToLegalListMoves(moves);
  }

  void legalRookMoves(String position) {
    int i = int.parse(position[1]);
    int j = position[0].codeUnitAt(0) - 'a'.codeUnitAt(0) + 1;

    List<int> moves = [];

    if (!(_positionHistory.contains(8 * j - (i + 1))) && i + 1 <= 8) {
      int k = i + 1;
      while (k <= 8) {
        moves.add(8 * j - k);
        k++;

        if (_positionHistory.contains(8 * j - k)) {
          break;
        }
      }
    }

    if (!(_positionHistory.contains(8 * j - (i - 1))) && i - 1 > 0) {
      int k = i - 1;
      while (k <= 8) {
        moves.add(8 * j - k);
        k--;
        if (_positionHistory.contains(8 * j - k)) {
          break;
        }
      }
    }

    if (!(_positionHistory.contains(8 * (j + 1) - (i))) && j + 1 <= 8) {
      int k = j + 1;
      while (k > 0) {
        moves.add(8 * k - i);
        k++;
        if (_positionHistory.contains(8 * k - i)) {
          break;
        }
      }
    }

    if (!(_positionHistory.contains(8 * (j - 1) - (i))) && j - 1 > 0) {
      int k = j - 1;
      while (k > 0) {
        moves.add(8 * k - i);
        k--;
        if (_positionHistory.contains(8 * k - i)) {
          break;
        }
      }
    }
    addToLegalListMoves(moves);
  }

  /*
    End of chess moves logic building part
   */

  /*
    Start of chess timer part
    The timer should toggle between each move made by
    the player
   */

  int _whiteCounter = 60;
  int _blackCounter = 60;
  Timer _timer;

  int get whiteCounter => _whiteCounter;

  int get blackCounter => _blackCounter;

  /// this function starts the timer for chess once the
  /// start button is pressed
  void startTimer() async{
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

  /// to check if the start button is pressed or not
  void hintOrStart(){
    if(_buttonText == 'START'){
      _buttonText = 'HINT';
      notifyListeners();
    }
  }

  /*
  END OF CHESS TIMER PART
   */

  /*
  START OF HINT PART FOR THE CHESS PIECES
   */

  /// to give hint
  void hintSquare(String moveHint){
    _possibleMoves = [];
    _isClicked = true;
    _possibleMoves.add(returnPosition(moveHint));
    notifyListeners();
  }

  /*
  END OF HINT PART FOR THE CHESS PIECES
   */


  /*
  START OF ADDING CAPTURED PIECES TO THE LIST
  SO THAT WE CAN DISPLAY IT ON THE SCREEN
   */

  List<Widget> get whitePiecesCaptured => _whitePiecesCaptured;
  List<Widget> get blackPiecesCaptured => _blackPiecesCaptured;

  void pieceCaptured(String pieceCaptured){
    switch(pieceCaptured){
      case 'pw':
        _whitePiecesCaptured.add(PieceCapturedWidget(path: 'soldier_w.png'));
        break;
      case 'pb':
        _blackPiecesCaptured.add(PieceCapturedWidget(path: 'soldier_b.png'));
        break;
      case 'nw':
        _whitePiecesCaptured.add(PieceCapturedWidget(path: 'horse_w.png'));
        break;
      case 'nb':
        _blackPiecesCaptured.add(PieceCapturedWidget(path: 'horse_b.png'));
        break;
      case 'bw':
        _whitePiecesCaptured.add(PieceCapturedWidget(path: 'camel_w.png'));
        break;
      case 'bb':
        _blackPiecesCaptured.add(PieceCapturedWidget(path: 'camel_b.png'));
        break;
      case 'rw':
        _whitePiecesCaptured.add(PieceCapturedWidget(path: 'elephant_w.png'));
        break;
      case 'rb':
        _blackPiecesCaptured.add(PieceCapturedWidget(path: 'elephant_b.png'));
        break;
      case 'qw':
        _whitePiecesCaptured.add(PieceCapturedWidget(path: 'queen_w.png'));
        break;
      case 'qb':
        _blackPiecesCaptured.add(PieceCapturedWidget(path: 'queen_b.png'));
        break;
    }
    print(_whitePiecesCaptured.length);
    print(_blackPiecesCaptured.length);
    notifyListeners();
  }

}



/// widget that has the captured pieces
class PieceCapturedWidget extends StatelessWidget {

  PieceCapturedWidget({@required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 5,
      child: Image.asset('assets/images/$path',),
    );
  }
}
