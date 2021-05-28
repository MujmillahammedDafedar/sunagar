import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:sunagar/main.dart';
class StartingPoint extends StatefulWidget {
  @override
  _StartingPointState createState() => _StartingPointState();
}

class _StartingPointState extends State<StartingPoint> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 8,
        navigateAfterSeconds: new HomePage(),
        image: new Image.asset('assets/icon.png'),
        backgroundColor: Colors.blue.shade900,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.white
    );
  }
}
