import 'dart:convert';

List<ProfCard> professorFromJson(String str) =>
    List<ProfCard>.from(json.decode(str).map((x) => ProfCard.fromJson(x)));

class ProfCard {
  ProfCard({
    required this.email,
    required this.profName,
    required this.profSurname,
    required this.image,
    required this.insegnamenti,
  });

  String email;
  String profName;
  String profSurname;
  String image;
  List<String> insegnamenti;

  factory ProfCard.fromJson(Map<String, dynamic> json) => ProfCard(
        profName: json["nome"],
        profSurname: json["cognome"],
        image: json["pf"],
        insegnamenti: json["corsi"] == null
            ? []
            : List<String>.from(json["corsi"]!.map((x) => x)),
        email: json["email"],
      );
}
