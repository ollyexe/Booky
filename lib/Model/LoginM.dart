import 'package:meta/meta.dart';
import 'dart:convert';

LoginM loginFromJson(String str) => LoginM.fromJson(json.decode(str));


class LoginM {
  LoginM({
    this.loginState,
    this.stateDescription,
  });

  String? loginState;
  String? stateDescription;

  factory LoginM.fromJson(Map<String, dynamic> json) => LoginM(
    loginState: json["login_state"],
    stateDescription: json["state_description"],
  );
}


User userFromJson(String str) => User.fromJson(json.decode(str));



class User {
  User({
    required this.nome,
    required this.cognome,
    required this.ruolo,
    required this.pf,
  });

  String? nome;
  String? cognome;
  String? ruolo;
  String? pf;

  factory User.fromJson(Map<String, dynamic> json) => User(
    nome: json["nome"],
    cognome: json["cognome"],
    ruolo: json["ruolo"],
    pf: json["pf"],
  );
}
