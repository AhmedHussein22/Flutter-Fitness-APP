import 'package:cached_network_image/cached_network_image.dart';
import 'package:test_gradle/pages/do_exercises.dart';
import 'package:test_gradle/pages/exercise_json.dart';
import 'package:flutter/material.dart';
import "package:sleek_circular_slider/sleek_circular_slider.dart";
import 'package:test_gradle/shared/error_image.dart';
import 'package:test_gradle/shared/loading.dart';

class Details extends StatefulWidget {
  final Exercises exercises;
  Details({required this.exercises});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int second = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000725),
      appBar: AppBar(
        backgroundColor: Color(0xFFff2fc3),
        title: Text(
          "Exercises ${widget.exercises.title}",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: Hero(
              tag: widget.exercises.id,
              child: CachedNetworkImage(
                imageUrl: (widget.exercises.thumbnail),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                placeholder: (context, url) => Loading(),
                errorWidget: (context, url, error) => Error(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            width: 200,
            height: 200,
            child: SleekCircularSlider(
              appearance: CircularSliderAppearance(
                animationEnabled: true,
                customWidths: CustomSliderWidths(
                  handlerSize: 10,
                  progressBarWidth: 8,
                  shadowWidth: 30,
                ),
                customColors: CustomSliderColors(
                  progressBarColor: Color(0Xffff2fc3),
                  trackColor: Colors.white,
                  dotColor: Colors.white,
                  gradientStartAngle: 20,
                ),
              ),
              onChange: (double value) {
                setState(() {
                  second = value.toInt();
                });
              },
              initialValue: 180,
              max: 300,
              min: 5,
              innerWidget: (value) {
                return Container(
                  alignment: Alignment.center,
                  child: Text(
                    "${value.toInt()} Second",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
          MaterialButton(
            onPressed: () {
              print(second);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DoExercises(
                            exercises: widget.exercises,
                            second: second,
                          )));
            },
            color: Color(0Xffff2fc3),
            child: Text(
              "Start Exercises ",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            splashColor: Color(0Xffff2f00),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          )
        ],
      ),
    );
  }
}
