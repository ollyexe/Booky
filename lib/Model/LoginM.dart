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
