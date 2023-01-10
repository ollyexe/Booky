import 'dart:math';

import 'package:flutter/material.dart';
import 'package:progettoium/MainPages/GenericListOfSubjectsOrProfessors.dart';
import 'package:progettoium/MainPages/LessonsToBeSelected.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';

class SubCard {
  String? image;
  String subName;
  Color? startColor;
  Color? endColor;

  SubCard({this.image, required this.subName,this.startColor, this.endColor});
}

Widget subCard(BuildContext context, SubCard card, String? professorAlreadySelected){
  return GestureDetector(
    onTap: () {
      professorAlreadySelected != null ?
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const LessonsToBeSelected())) :
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => GenericListOfSubjectsOrProfessors(card.subName, null, null)));
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
        gradient: LinearGradient(colors: [card.startColor!, card.endColor!]),
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(card.image!),
          ),
          myText(card.subName, 20, Theme.of(context).colorScheme.onTertiaryContainer, FontWeight.w500),
        ],
      ),
    ),
  );
}


List<SubCard> getSubjectCards(Color color){
  List<SubCard> cards = [
    SubCard(
      image: 'https://www.open-minds.it/wp-content/uploads/2020/03/clil-matematica-inglese.jpg',
      subName: 'Matematica',
      startColor: color,//const Color(0xFF2889EB),
      endColor: Color(randomColorGradient()),
    ),
    SubCard(
      image: 'https://st3.depositphotos.com/3591429/13656/i/450/depositphotos_136562916-stock-photo-creative-website-banner.jpg',
      subName: 'Algebra',
      startColor: color, //const Color(0xFF2889EB),
      endColor: Color(randomColorGradient()),
    ),
    SubCard(
      image: 'https://www.shutterstock.com/image-vector/physics-chalkboard-background-hand-drawn-600w-1988419205.jpg',
      subName: 'Fisica',
      startColor: const Color(0xFF2889EB),
      endColor: Color(randomColorGradient()),
    ),
    SubCard(
      image: 'https://www.lffl.org/wp-content/uploads/2020/07/flutter-google-canonical-1155x770.jpg',
      subName: 'IUM',
      startColor: color, //const Color(0xFF2889EB),
      endColor: Color(randomColorGradient()),
    ),
    SubCard(
      image: 'https://www.asistar.it/var/ezdemo_site/storage/images/media/images/30-anni-web/11896-1-ita-IT/30-anni-web_hq.jpg',
      subName: 'TWEB',
      startColor: color, //const Color(0xFF2889EB),
      endColor: Color(randomColorGradient()),
    ),
  ];
  return cards;
}
int randomColorGradient(){
  List<int> gradients = [0xFFFFDDE1,0xFF7EA56C,0xFF00CDAC,0xFFEA8D8D ,0xFF1EAE98,0xFFBFF098 ,0xFFC33764];
  return gradients.elementAt(Random().nextInt(gradients.length));
}