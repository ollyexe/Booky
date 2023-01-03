import 'package:flutter/material.dart';

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

  factory Lecture.fromJson(Map<String,dynamic> json) => Lecture(
    date: json["data"],
    time: json["ora"],
    subject: json["nome_corso"],
    name: json["nome_docente"],
    surname: json["cognome_docente"],
    image: json["pf"],
    rating: json["stelle"],
    price: json["prezzo"],

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

/*
class Lectures {
  Lectures({
    required this.lecture,
  });

  List<Lecture> lecture;

  factory Lectures.fromJson(Map<String, dynamic> json) => Lectures(
    lecture: List<Lecture>.from(json["Lecture"].map((x) => Lecture.fromJson(x))),
  );


}
 */
