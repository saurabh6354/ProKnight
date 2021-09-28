import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

////

class PlayerVSOpponentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        centerTitle: true,
        title: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings_outlined,
              color: Colors.black,
              size: 30,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.refresh,
                color: Colors.black,
                size: 30,
              )),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.orange[100]])),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      timerContainer('Elon Musk', Colors.blue),
                      starVS(),
                      timerContainer('Elon Musk', Colors.yellow),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    raisedButton('Start', Colors.red),
                    raisedButton('Resume', Colors.blue),
                  ],
                )
              ],
            )),
      ),
    );
  }

  Widget raisedButton(text, color) {
    return Container(
      height: 45,
      width: 125,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 20),
      )),
    );
  }

  Widget starVS() {
    return Stack(
      children: [
        Icon(
          Icons.star,
          size: 65,
          color: Colors.orange[900],
        ),
        Positioned(
            bottom: 22,
            left: 20,
            child: Text(
              'V/S',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

  Widget timerContainer(timer, color) {
    return Container(
      height: 160,
      width: 125,
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: color, width: 5),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // add this
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                'https://bsmedia.business-standard.com/_media/bs/img/article/2020-04/24/full/1587746615-459.jpg',
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    color: color),
                child: Center(
                    child: Text(
                  timer,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
