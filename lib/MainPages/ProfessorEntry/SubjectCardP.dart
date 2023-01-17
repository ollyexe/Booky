import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';

import '../ProfessorEntry/appointmentsByProfAndBySubject.dart';



Widget subCardP(BuildContext context ,String subject, String prof){
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>  appointmentsByProfAndBySubject(prof,subject)));

    },
    child: Container(
      margin: const EdgeInsets.all(5),
      width: 180,
      padding: const EdgeInsets.all(10),
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
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage:  NetworkImage("https://www.graphicsprings.com/filestorage/stencils/2f3bdb9733c4a68659dc2900a7595fea.png?width=500&height=500"),
          ),
          myText(subject, 20, Theme.of(context).colorScheme.onTertiaryContainer, FontWeight.w500),
        ],
      ),
    ),
  );
}


int randomColorGradient(){
  List<int> gradients = [0xFFFFDDE1,0xFF7EA56C,0xFF00CDAC,0xFFEA8D8D ,0xFF1EAE98,0xFFBFF098 ,0xFFC33764];
  return gradients.elementAt(Random().nextInt(gradients.length));
}


Subjects subjectsFromJson(String str) => Subjects.fromJson(json.decode(str));
class Subjects {
  Subjects({
    required this.corsi,
  });

  List<String> corsi;

  factory Subjects.fromJson(Map<String, dynamic> json) => Subjects(
    corsi: json["corsi"] == null ? [] : List<String>.from(json["corsi"].map((x) => x)),
  );

}






Future<String> getSubjectByDoc(String email) async{

  Response response = await get(Uri.parse("http://172.20.10.11:9999/servlet_war_exploded/apiCorso?path=getCorsiByDoc&mail=$email"));

  if (response.statusCode == 200) {




    return  response.body;
  }
  else {
    throw Exception('Unexpected error occured!');
  }
}


