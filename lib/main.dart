import 'package:chess_app/chessBoard/boardProvider/move_provider.dart';
import 'package:chess_app/locator.dart';
import 'package:chess_app/screens/Login%20Screen/login_screen.dart';
import 'package:chess_app/screens/PlayersVSOpponentScreen/players_vs_opponent.dart';
import 'package:chess_app/screens/board/chessBoard.dart';
import 'package:chess_app/screens/Play%20With%20Friend%20Screen/chess_pwf_offline.dart';
import 'package:chess_app/screens/Game%20Option%20Screen/game_options.dart';
import 'package:chess_app/screens/Play%20With%20Friend%20Screen/play_with_friends.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> MoveProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginScreen(),
        '/gameOptionScreen': (context) => GameOptionScreen(),
        '/playWithFriends': (context) => PlayWithFriends(),
        '/chessBoard': (context) => ChessBoard(),
        '/pwfOffline': (context) => PWFOffline(),
        '/playerVSOpponent': (context) => PlayerVSOpponentScreen(),
      },
    );
  }
}
