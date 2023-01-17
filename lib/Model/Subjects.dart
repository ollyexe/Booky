import 'dart:convert';

Subjects subjectsFromJson(String str) => Subjects.fromJson(json.decode(str));

class Subjects {
  Subjects({
    required this.corsi,
  });

  List<String> corsi;

  factory Subjects.fromJson(Map<String, dynamic> json) => Subjects(
        corsi: json["corsi"] == null
            ? []
            : List<String>.from(json["corsi"].map((x) => x)),
      );
}
