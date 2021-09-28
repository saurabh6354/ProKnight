import 'package:flutter/material.dart';
import 'package:chess_app/screens/Login Screen/reset.dart';
import 'package:chess_app/screens/Login Screen/signup.dart';



class LoginPage1 extends StatefulWidget {
  @override
  _LoginPage1State createState() => new _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {

  final formKey = new GlobalKey<FormState>();

   String email, password;

  Color greenColor = Color(0xFF00AF19);

  //To check fields during submit
  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }




  //To Validate email
   String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              color: Colors.white24,
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/img2.png'),
                fit: BoxFit.fill,
              ), ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(key: formKey, child: _buildLoginForm())));
  }

  _buildLoginForm() {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
    child: ListView(children: [
    SizedBox(height: MediaQuery.of(context).size.height*0.35),

    TextFormField(
    decoration: InputDecoration(
    labelText: 'EMAIL',
    labelStyle: TextStyle(
    fontFamily: 'Trueno',
    fontSize: 25.0,
    color: Colors.black.withOpacity(1.0)),
    focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: greenColor),
    )),
    onChanged: (value) {
    this.email = value;
    },

    /*validator: (value) =>
              value!.isEmpty ? 'Email is required' : validateEmail(value) */
    ),
    TextFormField(
    decoration: InputDecoration(
    labelText: 'PASSWORD',
    labelStyle: TextStyle(
    fontFamily: 'Trueno',
    fontSize: 25.0,
    color: Colors.black.withOpacity(1.0)),
    focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: greenColor),
    )),
    obscureText: true,
    onChanged: (value) {
    this.password = value;
    },
    validator: (value) =>
    value.isEmpty ? 'Password is required' : null),
    SizedBox(height:  MediaQuery.of(context).size.height*0.005),

    GestureDetector(
    onTap: () {
    Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => ResetPassword()));
    },
    child: Container(
    alignment: Alignment(1.0, 0.0),
    padding: EdgeInsets.only(top: 15.0, left: 20.0),
    child: InkWell(
    child: Text('Forgot Password',
    style: TextStyle(
    color: greenColor,
    fontFamily: 'Trueno',
    fontSize: 20.0,
    decoration: TextDecoration.underline))))),


    SizedBox(height:  MediaQuery.of(context).size.height*0.03),

      new Container(
        height: MediaQuery.of(context).size.height*0.08,
        width: MediaQuery.of(context).size.width*0.80,
        //margin: EdgeInsets.fromLTRB(38.0, 90.0, 38.0, 0.0),
        child: new RaisedButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)),
            padding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 3.0),
            color: Colors.deepOrangeAccent,
            onPressed: () {
              print("Container clicked");

            },
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Image.asset(
                  'assets/images/login logo.png',
                  height: MediaQuery.of(context).size.height*0.03,
                ),

                new Container(
                    padding: EdgeInsets.only(left: 0.0,right: 0.0,top:18, bottom: 18),
                    child: new Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                ),
              ],
            )
        ),
      ),
      /*GestureDetector(
    onTap: () {

    },
    child: Container(
        new Image.asset(
          'assets/images/login logo.png',
          height: ScreenSize().height(context)*0.03,
        ),
    height:  MediaQuery.of(context).size.height*0.07,
    child: Material(
    borderRadius: BorderRadius.circular(15.0),
    shadowColor: Colors.greenAccent,
    color: Colors.orange,
    elevation: 7.0,
    child: Center(
    child: Text('LOGIN',
    style: TextStyle(
    color: Colors.white, fontFamily: 'Trueno'))))),
    ),*/
    SizedBox(height:  MediaQuery.of(context).size.height*0.03),


      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Not Registerd yet ?',
            style: TextStyle( fontSize: 20,
              color: Colors.blueAccent,
              fontFamily: 'Trueno',
            )),

        SizedBox(width:  MediaQuery.of(context).size.width*0.005),
        InkWell(
            onTap: (){
              print("Container clicked");
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SignupPage()));
            },                                                //Use this Material Page route when other method do not work

            child: Text('SignUp',
                style: TextStyle( fontSize: 25,
                    color: Colors.red,
                    fontFamily: 'Trueno',
                    decoration: TextDecoration.underline)))
      ])
    ]));
  }
}