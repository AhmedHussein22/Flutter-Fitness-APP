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
  DoExercises({this.exercises, this.second});
  @override
  _DoExercisesState createState() => _DoExercisesState();
}

class _DoExercisesState extends State<DoExercises> {
  bool _isCompleted = false;
  Exercise exercisejson;
  int endScond = 0;
  Timer time;

  @override
   void initState() {
    
    calc();
     super.initState();
   }
  void calc() {
    if (widget.exercises.gif != null) {
      time = Timer.periodic(Duration(seconds: 1),
     (t) 
     {
      if (t.tick == widget.second) {
        t.cancel();
        setState(() {
          _isCompleted = true;
        });
      
      }
      setState(() {
        endScond = t.tick;
      });
    });
      
    }
    else
    Loading();
    
  }
  

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

  @override
  
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
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
        body: Stack(
          children:
          <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Hero(
                  tag: widget.exercises.id,
                  child: CachedNetworkImage(
                    // fit: BoxFit.cover,
                    imageUrl:(widget.exercises.gif),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    placeholder: (context, url) {

                      return Loading();
                      
                    },
                    errorWidget: (context, url, error) {
                      return Error();
                    },
                    
 
                  ) ,
                  
                  ),
            ),
            _isCompleted != true 
                ? SafeArea(
                    child: Container(
                      padding: EdgeInsets.only(top:40),
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
                          SizedBox(height: 500,),
                          Text(
                            

                            "Time of exercise is:   $endScond/${widget.second} Second",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,

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
                      content: Text("Do you want DO This Exercises agine or back to home ?",
                       style: TextStyle(
                          color: Color(0Xff000725),
                          fontSize: 16,
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(exercises: widget.exercises,)));
                        }, 
                        child: Text("Do Agine",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                        ),
                        ),
                        ),
                        FlatButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        }, 
                        child: Text("Home",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                        ),
                        )
                        )
                      ],

                    )

                  ),
                ),
          ]
        ),
      )
    );
  }
}
