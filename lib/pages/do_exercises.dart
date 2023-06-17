import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:test_gradle/pages/detalis.dart';
import 'package:test_gradle/pages/exercise_json.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:test_gradle/pages/homePage.dart';
import 'package:test_gradle/shared/error_image.dart';
import 'package:test_gradle/shared/loading.dart';

class DoExercises extends StatefulWidget {
  final Exercises exercises;
  final int second;
  DoExercises({required this.exercises, required this.second});
  @override
  _DoExercisesState createState() => _DoExercisesState();
}

class _DoExercisesState extends State<DoExercises> {
  bool _isCompleted = false;
  
  int endScond = 0;
  late Timer time;
  Audio audio = Audio.load('assets/audio/audio2.mp3');
  Audio endaudio = Audio.load('assets/audio/audio.mp3');

  // AssetsAudioPlayer _assetsAudioPlayer;

  @override
  void initState() {
    // _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (this.mounted) {
        Future.delayed(const Duration(seconds: 3), () {
          calc();
        });
      }
    });

    super.initState();
  }

  void calc() async {
    print(_isCompleted);

    await audio.play();
    //await _assetsAudioPlayer.open(Audio("assets/audio/audio2.mp3"), showNotification: true, autoStart: true);
    time = Timer.periodic(Duration(seconds: 1), (t) async {
      if (t.tick == widget.second) {
        t.cancel();

        audio..pause();
        endaudio.play();
        setState(() {
          _isCompleted = true;
        });

        print(_isCompleted);
      }
      setState(() {
        endScond = t.tick;
      });
    });
  }

  @override
  void dispose() {
    time.cancel();
    audio
      ..pause()
      ..dispose();
    endaudio
      ..pause()
      ..dispose();
    // _assetsAudioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff000725),
      appBar: AppBar(
        backgroundColor: Color(0XFFff2fc3),
        title: Text(
          "Exercises ${widget.exercises.title}",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Hero(
            tag: widget.exercises.id,
            child: CachedNetworkImage(
              // fit: BoxFit.cover,

              imageUrl: (widget.exercises.gif),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              progressIndicatorBuilder: (context, url, progress) {
                if (progress.downloaded == progress.totalSize) {
                  //calc();
                }
                //progress.downloaded != progress.totalSize ? _gifDownloaded = false : _gifDownloaded = true;

                return Loading();
              },
              cacheKey: widget.exercises.id,
              errorWidget: (context, url, error) {
                return Error();
              },
            ),
          ),
        ),
        _isCompleted != true
            ? SafeArea(
                child: Container(
                  padding: EdgeInsets.only(top: 40),
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Do like this !",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0XFFff2fc3),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 500,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: new TextSpan(
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'Time of exercise is:  '),
                            TextSpan(
                              text: ' $endScond ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0XFFff2fc3),
                              ),
                            ),
                            TextSpan(text: ' / ${widget.second} Second'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: Container(
                    color: Color(0Xff000725),
                    child: AlertDialog(
                      backgroundColor: Color(0XFFff2fc3),
                      title: Text(
                        "You Finished This Exercises",
                        textAlign: TextAlign.left,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                        ),
                      ),
                      content: Text(
                        "Do you want DO This Exercises agine or back to home ?",
                        style: TextStyle(
                          color: Color(0Xff000725),
                          fontSize: 16,
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Details(
                                          exercises: widget.exercises,
                                        )));
                          },
                          child: Text(
                            "Do Agine",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                            },
                            child: Text(
                              "Home",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                              ),
                            ))
                      ],
                    )),
              ),
      ]),
    );
  }
}
