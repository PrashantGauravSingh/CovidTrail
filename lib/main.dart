import 'package:covid/CovidDataModel/CovidDataModel.dart';
import 'package:covid/Network/DataApiCall.dart';
import 'package:covid/ui/screens/SplashScreen.dart';
import 'package:covid/ui/screens/home.dart';
import 'package:covid/ui/screens/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flash/flash.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
        home: SplashScreen(),
        routes: {
          'transaction' : (ctx) => TransactionsScreen(),
        }
    //  home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

