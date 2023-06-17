import 'dart:async';
import 'package:flutter/services.dart';
import 'package:test_gradle/pages/homePage.dart';
import 'package:test_gradle/pages/onbording_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_gradle/shared/loading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fitness",
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFFff2fc3),
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      )),
      debugShowCheckedModeBanner: false,
      home: Start(),
      routes: <String, WidgetBuilder>{
        '/HomePage': (BuildContext context) => new HomePage(),
        '/OnBording': (BuildContext context) => new OnBording(),
      },
    );
  }
}

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('first_time');

    var _duration = new Duration(seconds: 3);

    if (firstTime != null && !firstTime) {
      // Not first time
      return new Timer(_duration, navigationPageHome);
    } else {
      // First time
      prefs.setBool('first_time', false);
      return new Timer(_duration, navigationPageOnBording);
    }
  }

  void navigationPageHome() {
    Navigator.of(context).pushReplacementNamed('/HomePage');
  }

  void navigationPageOnBording() {
    Navigator.of(context).pushReplacementNamed('/OnBording');
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Loading();
  }
}
