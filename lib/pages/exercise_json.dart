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
