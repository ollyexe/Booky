import 'dart:convert';

import 'package:flutter/material.dart';

List<Lecture> lectureFromJson(String str) =>
    List<Lecture>.from(json.decode(str).map((x) => Lecture.fromJson(x)));
String lecturesToJson(List<Lecture> data) => json.encode(data == null
    ? []
    : List<dynamic>.from(data.map((x) => x.toJson())).toString());

class Lecture {
  Lecture(
      {required this.name,
      required this.surname,
      required this.email,
      required this.subject,
      required this.date,
      required this.time,
      required this.image,
      required this.rating,
      required this.lRating,
      required this.price});

  String name;
  String surname;
  String email;
  String subject;
  String date;
  String time;
  NetworkImage image;
  double rating;
  double lRating;
  double price;

  factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
        date: json["data"],
        time: json["ora"],
        lRating: (double.parse(json["valutazione"])),
        subject: json["nome_corso"],
        email: json["email"],
        name: json["nome_docente"],
        surname: json["cognome_docente"],
        image: NetworkImage(json["pf"]),
        rating: (double.parse(json["stelle"])),
        price: double.parse(json["prezzo"]),
      );

  factory Lecture.local(
          String name,
          String surname,
          String subject,
          String date,
          String email,
          String time,
          NetworkImage image,
          double rating,
          double lRating,
          double price) =>
      Lecture(
        date: date,
        time: time,
        subject: subject,
        email: email,
        name: name,
        surname: surname,
        image: image,
        rating: rating,
        lRating: lRating,
        price: price,
      );

  Map<String, dynamic> toJson() => {
        "\"data\"": "\"" + date + "\"",
        "\"ora\"": "\"" + time + "\"",
        "\"nome_corso\"": "\"" + subject + "\"",
        "\"nome_docente\"": "\"" + name + "\"",
        "\"cognome_docente\"": "\"" + surname + "\"",
        "\"email\"": "\"" + email + "\"",
        "\"pf\"": "\"" + image.url + "\"",
        "\"stelle\"": "\"" + rating.toString() + "\"",
        "\"valutazione\"": "\"" + lRating.toString() + "\"",
        "\"prezzo\"": "\"" + price.toString() + "\"",
      };
}
