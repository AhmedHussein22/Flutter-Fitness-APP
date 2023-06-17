<<<<<<< HEAD
import 'dart:convert';

Exercise exerciseFromJson(String str) => Exercise.fromJson(json.decode(str));

class Exercise {
  final List<Exercises> exercises;

  Exercise({
    required this.exercises,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        exercises: List<Exercises>.from(json["exercises"].map((x) => Exercises.fromJson(x))),
      );
}

class Exercises {
  final String id;
  final String title;
  final String thumbnail;
  final String gif;
  final String seconds;

  Exercises({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.gif,
    required this.seconds,
  });

  factory Exercises.fromJson(Map<String, dynamic> json) => Exercises(
        id: json["id"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        gif: json["gif"],
        seconds: json["seconds"],
      );
}
=======
class Exercise {
  List<Exercises> exercises;

  Exercise({this.exercises});

  Exercise.fromJson(Map<String, dynamic> json) {
    if (json['exercises'] != null) {
      exercises = new List<Exercises>();
      json['exercises'].forEach((v) {
        exercises.add(new Exercises.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.exercises != null) {
      data['exercises'] = this.exercises.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exercises {
  String id;
  String title;
  String thumbnail;
  String gif;
  String seconds;

  Exercises({this.id, this.title, this.thumbnail, this.gif, this.seconds});

  Exercises.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    gif = json['gif'];
    seconds = json['seconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['gif'] = this.gif;
    data['seconds'] = this.seconds;
    return data;
  }
}
>>>>>>> 7e6eb9464ab91df3419d779388768abbcbb98852
