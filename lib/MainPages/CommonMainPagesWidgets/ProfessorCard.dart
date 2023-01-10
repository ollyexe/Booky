import 'dart:math';
import 'package:flutter/material.dart';
import 'package:progettoium/MainPages/GenericListOfSubjectsOrProfessors.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import '../LessonsToBeSelected.dart';

class ProfCard {
  String? image;
  String profName;
  String profSurname;
  List<String> insegnamenti;
  Color? startColor;
  Color? endColor;
  ProfCard({this.image, required this.profName,required this.profSurname,required this.insegnamenti, this.startColor, this.endColor});
}


Widget profCard(BuildContext context,ProfCard card,String? subjectAlreadySelected){
  return GestureDetector(
    onTap: () {
      subjectAlreadySelected != null ?
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const LessonsToBeSelected())) :
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>  GenericListOfSubjectsOrProfessors(null,"Prof. ${card.profName} ${card.profSurname}", null)));
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
        gradient: LinearGradient(colors: [card.startColor!, card.endColor!]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(card.image!),
          ),
          myText("Prof. ${card.profName} ${card.profSurname}", 17, Colors.white, FontWeight.w500),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, i) =>  myText(card.insegnamenti[i], 15, Colors.white54, FontWeight.w500),
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: card.insegnamenti.length
            )
          )
        ],
      ),
    ),
  );
}


List<ProfCard> getProfCards(Color color){
  //initializer from json getAllDocenti
  List<ProfCard> cards = [
    ProfCard(
      image: 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Cima_da_Conegliano%2C_God_the_Father.jpg',
      profName: 'Marco',
      profSurname : 'Molica',
      insegnamenti: ["TWEB","IUM","JAVA","BACKEND"],
      startColor: color,//const Color(0xFF2889EB),
      endColor: Color(randomColorGradient()),
    ),
    ProfCard(
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAbBB_oglMX609dUtMkvQcL3nmKuqOQmVfR2VIj0he6Q&s',
      profName: 'Matteo',
      profSurname: 'Barone',
      insegnamenti: ["Matematica","Algebra","Fisica"],
      startColor: color,//const Color(0xFF2889EB),
      endColor: Color(randomColorGradient()),
    ),
    ProfCard(
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAbBB_oglMX609dUtMkvQcL3nmKuqOQmVfR2VIj0he6Q&s',
      profName: 'Alex',
      profSurname: 'Abrate',
      insegnamenti: ["Matematica","Algebra","Fisica"],
      startColor: color,//const Color(0xFF2889EB),
      endColor: Color(randomColorGradient()),
    ),
    ProfCard(
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAbBB_oglMX609dUtMkvQcL3nmKuqOQmVfR2VIj0he6Q&s',
      profName: 'Mino',
      profSurname: 'Chimento',
      insegnamenti: ["Matematica","Algebra","Fisica"],
      startColor: color,//const Color(0xFF2889EB),
      endColor: Color(randomColorGradient()),
    )
  ];
  return cards;
}

int randomColorGradient(){
  List<int> gradients = [0xFFFFDDE1,0xFF7EA56C,0xFF00CDAC,0xFFEA8D8D ,0xFF1EAE98,0xFFBFF098 ,0xFFC33764];
  return gradients.elementAt(Random().nextInt(gradients.length));
}