import 'package:flutter/material.dart';
import 'package:chess_app/constant.dart';

class PlayWithFriends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Icon(Icons.arrow_back, size: 40,),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/pwfOffline');
              },
              child: Center(
                child: Image.asset(imageAsset + "pl.png"),
              ),
            ),
            SizedBox(height: 20),
            Center(child: Image.asset(imageAsset+"po.png")),
          ],
        ),
      ),
    );
  }
}
