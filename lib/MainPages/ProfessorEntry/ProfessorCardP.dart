import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import 'subjectsSelectedProf.dart';


List<ProfCard> professorFromJson(String str) => List<ProfCard>.from(json.decode(str).map((x) => ProfCard.fromJson(x)));

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
      insegnamenti: json["corsi"] == null ? [] : List<String>.from(json["corsi"]!.map((x) => x)),
      email: json["email"],

  );
}

int randomColorGradient(){
  List<int> gradients = [0xFFFFDDE1,0xFF7EA56C,0xFF00CDAC,0xFFEA8D8D ,0xFF1EAE98,0xFFBFF098 ,0xFFC33764];
  return gradients.elementAt(Random().nextInt(gradients.length));
}



Widget profCard(BuildContext context,ProfCard card){
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>  subjectsSelectedProf(card.email)));

    },
    child: Container(
      margin: const EdgeInsets.all(4),
      width: 180,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
        gradient: LinearGradient(colors: [Theme.of(context).colorScheme.tertiaryContainer, Color(randomColorGradient())]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(card.image),
          ),
          myText("Prof. ${card.profName} ${card.profSurname}", 17, Theme.of(context).colorScheme.onTertiaryContainer, FontWeight.w500),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, i) =>  myText(card.insegnamenti[i], 15, Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(0.5), FontWeight.w500),
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: card.insegnamenti.length
            )
          )
        ],
      ),
    ),
  );
}





Future<String> getAllDocenti() async{

  Response response = await get(Uri.parse("http://172.20.10.11:9999/servlet_war_exploded/apiUtente?path=getAllDocenti"));


  if (response.statusCode == 200) {





    return  response.body;
  }
  else {
    throw Exception('Unexpected error occured!');
  }
}