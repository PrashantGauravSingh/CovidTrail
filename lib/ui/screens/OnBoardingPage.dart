import 'package:covid/ui/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/images/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 13.0,fontFamily: "Raleway-Regular",fontWeight: FontWeight.w300);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 18.0, fontFamily: "Roboto-BlackItalic",fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      imageFlex: 2,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Fight against COVID-19",
          body:
          "Clean your hands often. Use soap and water, or an alcohol-based hand rub.",
          image: _buildImage('fightCorona'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Hand Wash",
          body:
          "Clean your hands often. Use soap and water, or an alcohol-based hand rub.",
          image: _buildImage('handWash'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Social distancing",
          body: "A distance of atleast 2 meter is necessary to insure safety for all",
          image: _buildImage('coronaSocialDistancing'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Hand Sanitiser",
          body:
          "Use hand sanitiser with atleast 60% alcohol to ",
          image: _buildImage('handSanitizer'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Use Mask",
          body:
          "Cover mouth and nose with mask and make sure there are no gaps between your face and the mask.",
          image: _buildImage('mask'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Corona Warriors",
          body: "Special thanks to our real heroes who are fighting against the odd",
          image: _buildImage('fightingCoronaWarrior'),
//          footer: RaisedButton(
//            onPressed: () {
//              introKey.currentState?.animateScroll(0);
//            },
//            child: const Text(
//              'Start Screen',
//              style: TextStyle(color: Colors.white),
//            ),
//            color: Colors.lightBlue,
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(8.0),
//            ),
//          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}