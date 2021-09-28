import 'package:flutter/material.dart';
import 'package:chess_app/constant.dart';
import 'package:chess_app/spinning_wheel/home_page.dart';
import 'package:chess_app/spinning_wheel/profile.dart';
// as it's name implies it is the Login screen for the app
//TODO: to add login credentials of different platform
class GameOptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenSize().height(context),
        width: ScreenSize().width(context),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/img3.png'),
              fit: BoxFit.fill,
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.yellow[100]],
            )
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(top: 0.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CircleAvatar( foregroundImage: ExactAssetImage('assets/images/wheel-6-300.png'),
                      backgroundColor: Colors.blue,
                      radius: 35,

                    ),
                  ],
                ),
              ),
              onTap: () {
                print("Container clicked");
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              },
            ),

            SizedBox(
              height: ScreenSize().height(context) * 0.0001,
            ),
          //  Image.asset(imageAsset + "LOGO.png"),
            // add gesture detection to all the google
            // facebook, twitter and apple buttons,
            SizedBox(height: ScreenSize().height(context) * 0.3),

            SizedBox(
              height: ScreenSize().height(context) * 0.08,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/playWithFriends');
              },
              child: Image.asset(imageAsset + "pwf.png"),
            ),
            SizedBox(
              height: ScreenSize().height(context) * 0.02,
            ),
            Image.asset(imageAsset + "pwc.png"),
            SizedBox(
              height: ScreenSize().height(context) * 0.02,
            ),
            Image.asset(imageAsset + "t.png"),
            SizedBox(
              height: ScreenSize().height(context) * 0.02,
            ),
            Image.asset(imageAsset + "dc.png"),
              SizedBox(height: ScreenSize().height(context)*0.05,),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(top: 0.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar( foregroundImage: ExactAssetImage('assets/images/playerProfile.jpg'),
                      backgroundColor: Colors.blue,
                      radius: 25,

                    ),
                  ],
                ),
              ),
              onTap: () {
                print("Container clicked");
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ProfileApp()));
              },
            ),

          ],
        ),
      ),
    );
  }
}
