import 'package:flutter/cupertino.dart';


// This class is used to return the size of the screen
// where the name of the function represents the actual
// measurement in a given orientation of a device
class ScreenSize {

  double height(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  double width(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
}


String imageAsset = "assets/images/"; // this is the path for image asset

int counterMove = 0;