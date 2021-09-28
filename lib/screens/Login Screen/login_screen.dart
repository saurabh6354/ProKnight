import 'package:flutter/material.dart';
import 'package:chess_app/constant.dart';
import 'package:chess_app/screens/Login Screen/login_form.dart';

// as it's name implies it is the Login screen for the app
//TODO: to add login credentials of different platform
class LoginScreen extends StatelessWidget {
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: ScreenSize().height(context) * 0.14,
            ),
           // Image.asset(imageAsset + "LOGO.png"),
            // add gesture detection to all the google
            // Login , facebook, twitter and apple buttons,
            SizedBox( height: ScreenSize().height(context) * 0.3,),
            new Container(
              height: ScreenSize().height(context)*0.08,
              width: ScreenSize().width(context)*0.80,
              //margin: EdgeInsets.fromLTRB(38.0, 90.0, 38.0, 0.0),
              child: new RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)),
                  padding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 3.0),
                  color: Colors.deepOrangeAccent,
                  onPressed: () {
                    print("Container clicked");
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => LoginPage1()));
                  },
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Image.asset(
                        'assets/images/login logo.png',
                        height: ScreenSize().height(context)*0.03,
                      ),

                      new Container(
                          padding: EdgeInsets.only(left: 0.0,right: 0.0,top:18, bottom: 18),
                          child: new Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                      ),
                    ],
                  )
              ),
            ),
            SizedBox(
              height: ScreenSize().height(context) * 0.03,
            ),
            Image.asset(imageAsset + "google_login.png"),
            SizedBox(
              height: ScreenSize().height(context) * 0.02,
            ),
            Image.asset(imageAsset + "facebook_login.png"),
            SizedBox(
              height: ScreenSize().height(context) * 0.02,
            ),
            /*
            Image.asset(imageAsset + "twitter_login.png"),
            SizedBox(
              height: ScreenSize().height(context) * 0.02,
            ),*/
            Image.asset(imageAsset + "apple_login.png"),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/gameOptionScreen');
              },
              child: Text('Temporary Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}
