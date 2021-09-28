import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
    ( r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
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
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/img2.png'),
                fit: BoxFit.fill,
              ),
              color: Colors.white24,
               ),

            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(key: formKey, child: _buildSignupForm())));
  }

  _buildSignupForm() {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
    child: ListView(children: [
    SizedBox(height: MediaQuery.of(context).size.height*0.32),
      TextFormField(
        decoration: InputDecoration(
            labelText: 'Name',
            labelStyle: TextStyle(color: Colors.black,
              fontFamily: 'Trueno',
              fontSize: 20.0,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: greenColor),
            )),
        onChanged: (value) {
          this.email = value;
        },),
      TextFormField(
        decoration: InputDecoration(
            labelText: 'EMAIL',
            labelStyle: TextStyle(color: Colors.black,
              fontFamily: 'Trueno',
              fontSize: 20.0,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: greenColor),
            )),
        onChanged: (value) {
          this.email = value;
        },
        validator: (value) =>
              value.isEmpty ? 'Email is required' : validateEmail(value)
      ),
      TextFormField(
        decoration: InputDecoration(
            labelText: 'Phone',
            labelStyle: TextStyle(color: Colors.black,
              fontFamily: 'Trueno',
              fontSize: 20.0,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: greenColor),
            )),
        onChanged: (value) {
          this.email = value;
        },),
      TextFormField(
          decoration: InputDecoration(
              labelText: 'PASSWORD',
              labelStyle: TextStyle(color: Colors.black,
                fontFamily: 'Trueno',
                fontSize: 20.0,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greenColor),
              )),
          obscureText: true,
          onChanged: (value) {
            this.password = value;
          },
          validator: (value) =>
          value.isEmpty ? 'Password is required' : null),
      SizedBox(height: MediaQuery.of(context).size.height*0.065),
      GestureDetector(
        onTap: () {

        },
        child: Container(
            height: MediaQuery.of(context).size.height*0.07,
            child: Material(
                borderRadius: BorderRadius.circular(0.0),
                shadowColor: Colors.greenAccent,
                color: greenColor,
                elevation: 7.0,
                child: Center(
                    child: Text('SIGN UP',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Trueno'))))),
      ),
      SizedBox(height: MediaQuery.of(context).size.height*0.02),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text('Go back',
                style: TextStyle(
                    color: greenColor,
                    fontFamily: 'Trueno',
                    decoration: TextDecoration.underline)))
      ])
    ]));
  }
}