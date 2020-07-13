import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:test_gradle/pages/detalis.dart';
import 'package:test_gradle/pages/exercise_json.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_gradle/shared/loading.dart';

class HomePage extends StatefulWidget {
   
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String rul =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";
  Exercise exercisejson;

  @override
  void initState() {
    
    getExercise();
    super.initState();
  }

  void getExercise() async {
    var resopns = await http.get(rul);

    var body = resopns.body;
    var decoder = jsonDecode(body);
    exercisejson = Exercise.fromJson(decoder);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000725),
      appBar: AppBar(
        backgroundColor: Color(0xFFff2fc3),
        title:Text(
                "Fitness APP",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            
    
        centerTitle: true,
      ),
      body: Container(
          child: exercisejson != null
              ? ListView(
                  children: exercisejson.exercises.map((e) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                      exercises: e,
                                    ),
                                    ),
                                    );
                      },
                      child: Hero(
                        tag: e.id,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                  imageUrl: (e.thumbnail),
                                  placeholder: (context, url) => Loading(),
                                   errorWidget: (context, url, error) => Icon(Icons.error_outline,color: Color(0xFFff2fc3),),

                                  //   AssetImage("assets/placeholder.jpg"),
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0Xffff2fc3),
                                        Color(0X00ff2fc3),
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.center,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 250,
                                padding: EdgeInsets.only(left: 10, bottom: 10),
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  e.title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )
              : Loading()),
    );
  }
}
