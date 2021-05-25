import 'package:flutter/cupertino.dart';

class NoInternet extends StatefulWidget {
  @override
  _NoInternetState createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('No internet connection !', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0

          ),),
          Center(
            child: Text('Please check your internet connection and try again', style: TextStyle(
                fontSize: 18.0

            ),),
          ),


        ],
      ),
    );
  }
}
