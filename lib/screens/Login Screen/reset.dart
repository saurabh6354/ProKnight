import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formKey = new GlobalKey<FormState>();

   String email;

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
            child: Form(key: formKey, child: _buildResetForm())));
  }

  _buildResetForm() {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
    child: ListView(children: [
    SizedBox(height: MediaQuery.of(context).size.height*0.36),

      TextFormField(
        decoration: InputDecoration(
            labelText: 'EMAIL',
            labelStyle: TextStyle(
                fontFamily: 'Trueno',
                fontSize: 20.0,
                color: Colors.black.withOpacity(1.0)),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: greenColor),
            )),
        onChanged: (value) {
          this.email = value;
        },
         validator: (value) =>
              value.isEmpty ? 'Email is required' : validateEmail(value)
      ),

      SizedBox(height: MediaQuery.of(context).size.height*0.07),
      GestureDetector(
        onTap: () {

        },
        child: Container(
            height: MediaQuery.of(context).size.height*0.07,
            child: Material(
                borderRadius: BorderRadius.circular(25.0),
                shadowColor: Colors.greenAccent,
                color: greenColor,
                elevation: 7.0,
                child: Center(
                    child: Text('RESET',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Trueno'))))),
      ),
      SizedBox(height: MediaQuery.of(context).size.height*0.03),
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