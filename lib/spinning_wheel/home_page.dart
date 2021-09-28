import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'rouletteScore.dart';
import 'package:chess_app/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StreamController _dividerController = StreamController<int>();
 // bool countDownComplete = false; //Global boolean variable
  bool _onPressedValue=true;
  final _wheelNotifier = StreamController<double>();

  @override


  @override
  void dispose() {
    super.dispose();
    _dividerController.close();
    _wheelNotifier.close();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(''),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Stack(
               children:[
          Container(
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [ Align(alignment: Alignment.center,
              ),
                SpinningWheel(
                  Image.asset('assets/images/wheel-6-300.png'),
                  width: MediaQuery.of(context).size.width*0.731,
                  height: MediaQuery.of(context).size.height*0.395,
                  initialSpinAngle: _generateRandomAngle(),
                  spinResistance: 0.6,
                  canInteractWhileSpinning: false,
                  dividers: 8,
                  onUpdate: _dividerController.add,
                  onEnd: _dividerController.add,

                  secondaryImage:
                  Image.asset('assets/images/go btn.png'),
                  //Image.asset('assets/images/roulette-center-300.png'),
                  secondaryImageHeight: MediaQuery.of(context).size.height*0.2,
                  secondaryImageWidth: MediaQuery.of(context).size.width*0.2,
                  shouldStartOrStop: _wheelNotifier.stream,
                ),
               /* GestureDetector(
                  onTap: (){
                    _wheelNotifier.sink.add(_generateRandomVelocity());
                  },
                  child: Image.asset(imageAsset + "go btn.png"),
                    height: MediaQuery.of(context).size.height*0.26,
                    width: MediaQuery.of(context).size.width*0.26,
                ),*/
                SizedBox(height: MediaQuery.of(context).size.height*0.02),

                StreamBuilder(
                  stream: _dividerController.stream,
                  builder: (context, snapshot) =>
                  snapshot.hasData ? RouletteScore(snapshot.data) : Container( ),
                ),

       /* StreamBuilder(
              stream: _dividerController.stream,
              builder: (context, snapshot) =>
              snapshot.hasData ? RouletteScore(snapshot.data)
              : ListView(),),
                 */





                SizedBox(height: 30),
                 // elevated button that can be disabled for 30s after a click
                ElevatedButton(
                              child: Text("Spin"),
                          onPressed: _onPressedValue==true?() {
                            setState(() {
                              _onPressedValue = false;
                              _wheelNotifier.sink.add(_generateRandomVelocity());
                            });
                            Timer(Duration(seconds: 30), () {
                              setState(() {
                                _onPressedValue = true;
                              });
                            });
                          }:null,
                            style:
                            ElevatedButton.styleFrom(
                              minimumSize: Size(200, 50), primary: Colors.red,
                            )),


                      /* RaisedButton(
                   child: Text('OTP'),
                    onPressed: _onPressedValue==true?(){
                    setState((){
                _onPressedValue=false;
                _wheelNotifier.sink.add(_generateRandomVelocity());
                          });
            Timer(Duration(seconds: 30),(){
              setState((){
                _onPressedValue=true;
              });
            });

              }:null)*/
               /* ElevatedButton(
                  child: Text("Spin"),
                  onPressed: () =>
                      _wheelNotifier.sink.add(_generateRandomVelocity()),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50), primary: Colors.red,
                )
                ),*/
              ],
            ),
          ),

                    //Floating action button made transparent to use secondary image as a button

                 new Align(alignment: Alignment(0.0,-0.60),        //fab button positioning center(0,0) above -ve below +ve
                   child: FloatingActionButton(elevation: 0,

                    // child:  new Icon(Icons.,color: Colors.white,),
                     tooltip: 'Run the wheel ',        //For telling the details of button
                     
                     backgroundColor: Colors.transparent.withOpacity(0),
                     onPressed: (){_wheelNotifier.sink.add(_generateRandomVelocity());} ,
                     //label: Text('G0'),
                     // tooltip: 'Run the wheel ',
                   //  shape: RoundedRectangleBorder(
                       //  borderRadius: BorderRadius.circular(100)),

                   ),

                 )



                        //fab button over an image to be used as a button

             /*
                 new Align(alignment: Alignment(0.0,-0.60),
                   child: FloatingActionButton(elevation: 05,
                     child:  new Icon(Icons.play_arrow_outlined,color: Colors.white,),
                     tooltip: 'Run the wheel ',
                     backgroundColor: Colors.redAccent.shade400,
                     onPressed: (){_wheelNotifier.sink.add(_generateRandomVelocity());} ,
                     //label: Text('G0'),
                     // tooltip: 'Run the wheel ',
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(100)),

                   ),

                 )*/


                 /*  new Align(alignment: Alignment(0.0,-0.60),
                   child: FloatingActionButton.extended(elevation: 05,
                       //child:  new Icon(Icons.play_arrow_outlined,color: Colors.white,),
                     tooltip: 'Run the wheel ',
                       backgroundColor: Colors.redAccent.shade400,
                       onPressed: (){_wheelNotifier.sink.add(_generateRandomVelocity());} ,
                    label: Text('G0'),
                    // tooltip: 'Run the wheel ',
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),

                       ),

                 )  */
        ],
    ));
  }

  double _generateRandomVelocity() => (Random().nextDouble() * 9000) +8000;

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}

