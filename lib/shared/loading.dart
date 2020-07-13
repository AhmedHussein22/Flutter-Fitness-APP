import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF000725),
      child: Center(
        
        child: SpinKitFadingCircle(
          color: Color(0xFFff2fc3),
          size: 50.0,
          duration: Duration(seconds: 3),


        ),
      ),
    );
  }
}
