import 'package:chess_app/chessBoard/board_model.dart';
import 'package:get_it/get_it.dart';

import 'chessBoard/chess_board_controller.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  final _chessController = ChessBoardController();
  locator.registerFactory<BoardModel>(() => BoardModel(400, (covariant) {
        print("moved");
      }, (pieceColor) {}, (pieceColor) {}, () {}, true, _chessController,
          true));
}
