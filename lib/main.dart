import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:sunagar/set_state.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MultiProvider(
  providers: [
    ListenableProvider<MyState>(create: (_) => MyState()),
  ],
  child:   MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.blue.shade900,
      home: HomePage()),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String string;

  @override
  void initState() {
    super.initState();
    Provider.of<MyState>(context, listen: false).start();
    Provider.of<MyState>(context, listen: false).changeState();
    print(']]]]');
    print(Provider.of<MyState>(context, listen: false).result);
  }

  @override
  Widget build(BuildContext context) {
    switch (Provider.of<MyState>(context, listen: false).result.keys.toList()[0]) {
      case ConnectivityResult.none:
        string = "off";
        break;
      case ConnectivityResult.mobile:
        string = "on";
        break;
      case ConnectivityResult.wifi:
        string = "on";
    }


    return Consumer<MyState>(

      builder: (context, data, _child) =>  SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue.shade900,
               // ignore: unrelated_type_equality_checks
               body : (string == 'off') ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Icon(
                        Icons.signal_cellular_connected_no_internet_4_bar_rounded,
                        size: 45.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'No internet connection !',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24.0),
                      ),
                    ],
                  ),
                ) : WebView(
                         initialUrl: 'https://www.sunagar.com/',
                         javascriptMode: JavascriptMode.unrestricted,
                       ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Provider.of<MyState>(context, listen: false).stop();
  }
}


