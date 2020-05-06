import 'package:covid/ui/screens/OnBoardingPage.dart';
import 'package:covid/ui/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingPage(),
        ),
      );

    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child:Image.asset("assets/images/playstore-icon.png",fit: BoxFit.cover,height: 100,width: 100,),)
            ),
            Padding(
              padding: const EdgeInsets.only(left:8.0,top: 8.0),
              child: Text(
                "Covid Trail",
                style: TextStyle(fontFamily:"Roboto-Bold",color: Color(0xff2BBCD4)),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
