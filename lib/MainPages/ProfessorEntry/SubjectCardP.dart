import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';

import '../ProfessorEntry/appointmentsByProfAndBySubject.dart';



Widget subCardP(BuildContext context, String subject, String prof){
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
            backgroundImage: NetworkImage("https://www.asistar.it/var/ezdemo_site/storage/images/media/images/30-anni-web/11896-1-ita-IT/30-anni-web_hq.jpg"),
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
//
// List<SubCard> getSubjectCards(Color color){
//   List<SubCard> cards = [
//     SubCard(
//       // image: 'https://www.open-minds.it/wp-content/uploads/2020/03/clil-matematica-inglese.jpg',
//       subName: 'Matematica',
//
//     ),
//     SubCard(
//       // image: 'https://st3.depositphotos.com/3591429/13656/i/450/depositphotos_136562916-stock-photo-creative-website-banner.jpg',
//       subName: 'Algebra',
//
//     ),
//     SubCard(
//       // image: 'https://www.shutterstock.com/image-vector/physics-chalkboard-background-hand-drawn-600w-1988419205.jpg',
//       subName: 'Fisica',
//
//     ),
//     SubCard(
//       // image: 'https://www.lffl.org/wp-content/uploads/2020/07/flutter-google-canonical-1155x770.jpg',
//       subName: 'IUM',
//
//     ),
//     SubCard(
//       // image: 'https://www.asistar.it/var/ezdemo_site/storage/images/media/images/30-anni-web/11896-1-ita-IT/30-anni-web_hq.jpg',
//       subName: 'TWEB',
//
//     ),
//   ];
//   return cards;
// }


// To parse this JSON data, do
//
//     final subjects = subjectsFromJson(jsonString);


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

  Response response = await get(Uri.parse("http://192.168.1.15:9999/servlet_war_exploded/apiCorso?path=getCorsiByDoc&mail=$email"));

  print("http://192.168.1.15:9999/servlet_war_exploded/apiCorso?path=getCorsiByDoc&mail=$email");
  if (response.statusCode == 200) {



    print("got the professors");

    return  response.body;
  }
  else {
    throw Exception('Unexpected error occured!');
  }
}
