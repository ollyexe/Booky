import 'package:flutter/material.dart';

class Lecture{
  String name;
  String surname;
  String subject;
  DateTime date;
  NetworkImage? image;
  double? rating;

  Lecture(this.name,this.surname,this.subject,this.date,this.image,this.rating);
}

