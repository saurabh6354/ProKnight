import 'package:flutter/material.dart';
import 'package:chess_app/constant.dart';

class setting extends StatelessWidget {
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
    'assets/images/img.png'),
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
        new Container(),Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
              Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: MediaQuery.of(context).size.height*0.07,
                width: MediaQuery.of(context).size.width*0.44,
                child: RaisedButton.icon(
                     color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    onPressed: () {},
                    icon: Icon(Icons.volume_up),
                    label: Text("Sound"))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: MediaQuery.of(context).size.height*0.07,
                width: MediaQuery.of(context).size.width*0.44, // specific value
                child: RaisedButton.icon(
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    onPressed: () {},
                    icon: Icon(Icons.music_note),
                    label: Text("Music"))),
          ),],),
          new Container(
            margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 5.0),
            child: new RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                padding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 3.0),
                color: Colors.yellow,
                onPressed: () {
                  print("Container clicked");
                 // Navigator.push(
                    //  context, MaterialPageRoute(builder: (_) => LoginPage1()));
                },
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Image.asset(
                      'assets/images/help logo.png',
                      height: 24.0,
                    ),
                    new Container(
                        padding: EdgeInsets.only(left: 0.0,right: 0.0,top:18, bottom: 18),
                        child: new Text("Help",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                    ),
                  ],
                )
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 5.0),
            child: new RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                padding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 3.0),
                color: Colors.green,
                onPressed: () {
                  print("Container clicked");
                  // Navigator.push(
                  //  context, MaterialPageRoute(builder: (_) => LoginPage1()));
                },
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Image.asset(
                      'assets/images/legal logo.png',
                      height: 24.0,
                    ),
                    new Container(
                        padding: EdgeInsets.only(left: 0.0,right: 0.0,top:18, bottom: 18),
                        child: new Text("Legal",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                    ),
                  ],
                )
            ),
          ),


    ],
    ),

    ));
  }}