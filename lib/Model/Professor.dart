import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

List<Professor?>? professorFromJson(String str) => json.decode(str) == null ? [] : List<Professor?>.from(json.decode(str)!.map((x) => Professor.fromJson(x)));

String professorToJson(List<Professor?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class Professor {
  Professor({
    required this.id,
    required this.email,
    required this.password,
    required this.nome,
    required this.cognome,
    required this.pf,
    required this.stelle,
    required this.corsi,
  });

  String? id;
  String? email;
  String? password;
  String? nome;
  String? cognome;
  String? pf;
  String? stelle;
  List<String?>? corsi;

  factory Professor.fromJson(Map<String, dynamic> json) => Professor(
    id: json["ID"],
    email: json["email"],
    password: json["password"],
    nome: json["nome"],
    cognome: json["cognome"],
    pf: json["pf"],
    stelle: json["stelle"],
    corsi: json["corsi"] == null ? [] : List<String?>.from(json["corsi"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "email": email,
    "password": password,
    "nome": nome,
    "cognome": cognome,
    "pf": pf,
    "stelle": stelle,
    "corsi": corsi == null ? [] : List<dynamic>.from(corsi!.map((x) => x)),
  };
}


class ProfCard {
  ProfCard({
    required this.email,
    required this.profName,
    required this.profSurname,
    required this.image,
    required this.insegnamenti,

  });

  String? email;
  String? profName;
  String? profSurname;
  String? image;
  List<String?>? insegnamenti;
  Color? endColor;

  factory ProfCard.fromJson(Map<String, dynamic> json) => ProfCard(
    profName: json["nome"],
    profSurname: json["cognome"],
    image: json["pf"],
    insegnamenti: json["corsi"] == null ? [] : List<String?>.from(json["corsi"]!.map((x) => x)),
    email: json["email"],
  );
}

int randomColorGradient(){
  List<int> gradients = [0xFFFFDDE1,0xFF7EA56C,0xFF00CDAC,0xFFEA8D8D ,0xFF1EAE98,0xFFBFF098 ,0xFFC33764];
  return gradients.elementAt(Random().nextInt(gradients.length));
}
