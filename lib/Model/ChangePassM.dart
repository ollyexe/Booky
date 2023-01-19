import 'dart:convert';

CPassM cPassMFromJson(String str) => CPassM.fromJson(json.decode(str));

class CPassM {
  CPassM({
    this.changeState,
    this.stateDescription,
  });

  String? changeState;
  String? stateDescription;

  factory CPassM.fromJson(Map<String, dynamic> json) => CPassM(
    changeState: json["change_state"],
    stateDescription: json["state_description"],
  );
}