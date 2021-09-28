import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chess_app/constant.dart';
import 'package:chess_app/screens/Login Screen/login_screen.dart';
class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
        onTap: () {
      Navigator.pop(context);
    },
    child: Icon(
    Icons.arrow_back,
    color: Colors.black,
    ),
    ),),
    body: Container(
    height: ScreenSize().height(context),
    width: ScreenSize().width(context),
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage(
    'assets/images/img1.png'),
    fit: BoxFit.fill,
    ),
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.white, Colors.yellow[100]],
    )
    ),


    child: new Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children : <Widget>[
      SizedBox(height:40,),
    new Container(),Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(width: 10,),
    CircleAvatar(
    backgroundImage: NetworkImage(
      "https://cdn.icon-icons.com/icons2/2468/PNG/512/user_kids_avatar_user_profile_icon_149314.png",
    ),
      radius: 75.0,
    ),
     SizedBox(width:50 ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
    height: MediaQuery.of(context).size.height*0.07,
    width: MediaQuery.of(context).size.width*0.3, // specific value
    child: RaisedButton.icon(
    color: Colors.purple,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0)),
    onPressed: () {},
    icon: Icon(Icons.edit),
    label: Text("Edit"))),
    ),],),

    new Container(
    child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 20.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    Text(
    "Personal Info",
    style: TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold ,
    fontSize: 28.0
    ),
    ),
    SizedBox(
    height: 5.0,
    ),
      Text.rich(
        TextSpan(
          children: [
            TextSpan(text: 'User ID :                             ' ,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),),
            TextSpan(
              text: '   12345',
              style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.normal, color: Colors.white,fontSize: 20),
            ),

          ],
        ),
      ),
      Text.rich(
        TextSpan(
          children: [
            TextSpan(text: 'Name :                                   ' ,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 24),),
            TextSpan(
              text: 'name',
              style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.normal, color: Colors.white,fontSize: 20),
            ),

          ],
        ),
      ),
      Text.rich(
        TextSpan(
          children: [
            TextSpan(text: 'Email id :                  ' ,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 24),),
            TextSpan(
              text: 'sk@gmail.com',
              style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.normal, color: Colors.white,fontSize: 20),
            ),
          ],
        ),
      ),
      Text.rich(
        TextSpan(
          children: [
            TextSpan(text: 'Mobile No :                    ' ,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 24),),
            TextSpan(
              text: '790xxxxxx',
              style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.normal, color: Colors.white,fontSize: 20),
            ),
          ],
        ),
      ),
    /*
    Text('User ID :                       12345\n'
        'Name:                            name\n'
    'Email id :          sk@gmail.com\n'
    'Mobile No :               790xxxxx\n',
    style: TextStyle(
    fontSize: 22.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    letterSpacing: 2.0,
    ),
    ),*/
      SizedBox(
        height: 50.0,
      ),
      Text(
        "STATISTICS",
        style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold ,
            fontSize: 28.0
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text.rich(
        TextSpan(
          children: [
            TextSpan(text: 'Coin Balance :                    ' ,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),),
            TextSpan(
              text: ' 12345',
              style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.normal, color: Colors.white,fontSize: 20),
            ),

          ],
        ),
      ),
      Text.rich(
        TextSpan(
          children: [
            TextSpan(text: 'Score:                                  ' ,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 24),),
            TextSpan(
              text: ' 28.5K',
              style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.normal, color: Colors.white,fontSize: 20),
            ),

          ],
        ),
      ),
      Text.rich(
        TextSpan(
          children: [
            TextSpan(text: 'Ranking :                                ' ,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 24),),
            TextSpan(
              text: '123',
              style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.normal, color: Colors.white,fontSize: 20),
            ),
          ],
        ),
      ),
      /*
      Text('Coin Balance :              12345\n'
          'Score:                           28.5K\n'
          'Ranking :                         123\n' ,

         style: TextStyle(
          fontSize: 22.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          letterSpacing: 2.0,
        ),
      ),*/
    ],
    ),
    ),
    ),
    SizedBox(
    height: 2.0,
    ),
      new Container(
        margin: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 5.0),
        child: new RaisedButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)),
            padding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 3.0),
            color: Colors.red,
            onPressed: () {
              print("Container clicked");
               Navigator.push(
                context, MaterialPageRoute(builder: (_) => LoginScreen()));
            },
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Image.asset(
                  'assets/images/log out logo.png',
                  height: 24.0,
                ),
                new Container(
                    padding: EdgeInsets.only(left: 0.0,right: 0.0,top:18, bottom: 18),
                    child: new Text("Logout",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                ),
              ],
            )
        ),
      ),

    ],)));


    }}






























































































       /*

      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.redAccent, Colors.pinkAccent]
                  )
              ),
              child: Container(
                width: double.infinity,
                height: 350.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://cdn.icon-icons.com/icons2/2468/PNG/512/user_kids_avatar_user_profile_icon_149314.png",
                        ),
                        radius: 50.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(

                                  children: <Widget>[
                                    Text(
                                      "Coin",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "100",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.pinkAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(

                                  children: <Widget>[
                                    Text(
                                      "Score",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "28.5K",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.pinkAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(

                                  children: <Widget>[
                                    Text(
                                      "Ranking",
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "10",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.pinkAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Personal Info:",
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontStyle: FontStyle.normal,
                        fontSize: 28.0
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Text('User ID :                      12345\n'
                      'Email id :           sk@gmail.com\n'
                      'Mobile No :             790xxxxx\n',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 300.00,

            child: RaisedButton(
                onPressed: (){},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)
                ),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.redAccent,Colors.pinkAccent]
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text("Logout",
                      style: TextStyle(color: Colors.white, fontSize: 26.0, fontWeight:FontWeight.w300),
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}*/