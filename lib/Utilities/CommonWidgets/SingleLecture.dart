import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:math' as math;

List<Lecture> lectureFromJson(String str) => List<Lecture>.from(json.decode(str).map((x) => Lecture.fromJson(x)));

class Lecture{
  Lecture(
      {required this.name,
        required this.surname,
        required this.subject,
        required this.date,
        required this.time,
        required this.image,
        required this.rating,
        required this.price});


  String name;
  String surname;
  String subject;
  String date;
  String time;
  NetworkImage image;
  double rating;
  double price;

  factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
    date: json["data"],
    time: json["ora"],
    subject: json["nome_corso"],
    name: json["nome_docente"],
    surname: json["cognome_docente"],
    image: NetworkImage(json["pf"]),
    rating: (double.parse(json["stelle"])),
    price: double.parse(json["prezzo"]),

  );

  factory Lecture.local(String name,
      String surname,
      String subject,
      String date,
      String time,
      NetworkImage image,
      double rating,
      double price) => Lecture(
    date: date,
    time: time,
    subject: subject,
    name: name,
    surname: surname,
    image:image,
    rating: rating,
    price: price,

  );
}




