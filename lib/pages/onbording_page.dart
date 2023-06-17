import 'package:test_gradle/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBording extends StatefulWidget {
  @override
  _OnBordingState createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  var pages = [
    PageViewModel(
      title: "Habit",
      body: "In order to succeed in fitness you must develop habits. Start one today....",
      image: Center(
          child: Image.asset(
        "assets/images/screen1.jpg",
        height: 500,
        width: 700,
      )),
      decoration: const PageDecoration(
        bodyTextStyle: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(fontSize: 24, color: Color(0Xffff0e30), fontWeight: FontWeight.bold),
        pageColor: Color(0Xff000725),
      ),
    ),
    PageViewModel(
      title: "Discipline",
      body: " Discipline comes from the willingness to learn, grow, and listen....",
      image: Center(
          child: Image.asset(
        "assets/images/screen2.png",
        height: 400,
        width: 500,
      )),
      decoration: const PageDecoration(
        bodyTextStyle: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(fontSize: 24, color: Color(0Xffff0e30), fontWeight: FontWeight.bold),
        pageColor: Color(0Xff000725),
      ),
    ),
    PageViewModel(
      title: "Respect",
      body: "it is just as courageous to stop at the right time as it is to fight through setbacks when the timing is right....",
      image: Center(
          child: Image.asset(
        "assets/images/screen3.png",
        height: 500,
        width: 500,
      )),
      decoration: const PageDecoration(
        bodyTextStyle: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(fontSize: 24, color: Color(0Xffff0e30), fontWeight: FontWeight.bold),
        pageColor: Color(0Xff000725),
      ),
    ),
    PageViewModel(
      title: "Purpose",
      body: "Purpose is the why behind your goal....",
      image: Center(
          child: Image.asset(
        "assets/images/screen4.png",
        height: 500,
        width: 500,
      )),
      decoration: const PageDecoration(
        bodyTextStyle: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(fontSize: 24, color: Color(0Xffff0e30), fontWeight: FontWeight.bold),
        pageColor: Color(0Xff000725),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      next: SizedBox(),
      pages: pages,
      globalBackgroundColor: Color(0Xff000725),
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
      onSkip: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
      showSkipButton: true,
      skip: const Icon(
        Icons.cancel,
        color: Colors.white,
        size: 40,
      ),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.blue.shade800,
          color: Colors.white,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0))),
    ));
  }
}
