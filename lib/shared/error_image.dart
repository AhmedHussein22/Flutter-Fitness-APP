import 'package:flutter/material.dart';
import 'package:test_gradle/pages/homePage.dart';

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0XFFff2fc3),
      title: Text(
        "OOPS ",
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Colors.white,
          fontSize: 21,
        ),
      ),
      content: Text(
        "An error occurred during download...",
        style: TextStyle(
          color: Color(0Xff000725),
          fontSize: 16,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Text(
            "OK",
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
            ),
          ),
        )
      ],
    );
  }
}
