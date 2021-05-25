import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';

import 'noInternet.dart';

class MyState extends ChangeNotifier{
  late bool _net ;
  Map _source = {ConnectivityResult.none: false};
  MyConnectivity _connectivity = MyConnectivity.instance;
  bool get state => _net;
  Map get result => _source;

  set net(bool val){
    _net = val;
  }
  set source(Map val){
    _source = val;
  }



  changeState(){
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.none:
        net = false;
        break;
      case ConnectivityResult.mobile:
        net = true;
        break;
      case ConnectivityResult.wifi:
        net = true;
    }

  }

  start(){
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
     source = source;
      print(source);
      //changeState();
    });

  }

  stop() {
    _connectivity.disposeStream();
    super.dispose();

  }



}