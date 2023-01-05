import 'dart:math';
import 'package:flutter/material.dart';
import 'package:progettoium/MainPages/ResearchByProfessors/selectedProfessor.dart';
import 'package:progettoium/MainPages/ResearchBySubjects/selectedSubject.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';

import '../ResearchByProfessors/byProfessor.dart';
class BySubject extends StatefulWidget {
  const BySubject({Key? key}) : super(key: key);

  @override
  State<BySubject> createState() => _BySubjectState();
}

class _BySubjectState extends State<BySubject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(placeholder, const Text("Scegli la materia"), 60, context),
      backgroundColor: const Color(0xFFE7E7E7),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: GridView.count(
          crossAxisCount: 2 ,
          children: List.generate(getSubjectCards().length,(index){
            return Container(
              child: subCard(context, index, getSubjectCards()),
            );
          }),
        ),
      ),
    );
  }
}

class SubCard {
  String? image;
  String? subName;
  String? profName;
  String? time;
  Color? startColor;
  Color? endColor;

  SubCard({this.image, this.subName, this.profName, this.time, this.startColor, this.endColor});
}

Widget subCard(BuildContext context,int index, List<SubCard> cards){
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const selectedProfessor()));
    },
    child: Container(
      margin: const EdgeInsets.all(5),
      height: 250,
      width: 180,
      padding: const EdgeInsets.all(10),
      decoration: boxDecoration(
        radius: 8,
        spreadRadius: 1,
        blurRadius: 4,
        gradient: LinearGradient(colors: [cards[index].startColor!, cards[index].endColor!]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(cards[index].image! ),
          ),
          Text("${cards[index].subName!}", style: secondaryTextStyle(color: Colors.white, size: 17)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${cards[index].profName!}", style: secondaryTextStyle(color: Colors.white54, size: 15)),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(cards[index].time!, style: secondaryTextStyle(color: Colors.white54, size: 15)),
          ]),
        ],
      ),
    ),
  );
}

List<SubCard> getSubjectCards(){
  List<SubCard> cards = [
    SubCard(
      image: 'https://www.open-minds.it/wp-content/uploads/2020/03/clil-matematica-inglese.jpg',
      subName: 'Matematica',
      profName: 'Matteo Barone',
      time: 'Inizio 16:00',
      startColor: const Color(0xFF2889EB),
      endColor: Color(randomColorGradient()),
    ),
    SubCard(
      image: 'https://st3.depositphotos.com/3591429/13656/i/450/depositphotos_136562916-stock-photo-creative-website-banner.jpg',
      subName: 'Algebra',
      profName: 'Alex Abrate',
      time: 'Inizio 16:00',
      startColor: const Color(0xFF2889EB),
      endColor: Color(randomColorGradient()),
    ),
    SubCard(
      image: 'https://www.shutterstock.com/image-vector/physics-chalkboard-background-hand-drawn-600w-1988419205.jpg',
      subName: 'Fisica',
      profName: 'Matteo Barone',
      time: 'Inizio 16:00',
      startColor: const Color(0xFF2889EB),
      endColor: Color(randomColorGradient()),
    ),
    SubCard(
      image: 'https://www.lffl.org/wp-content/uploads/2020/07/flutter-google-canonical-1155x770.jpg',
      subName: 'IUM',
      profName: 'Matteo Barone',
      time: 'Inizio 16:00',
      startColor: const Color(0xFF2889EB),
      endColor: Color(randomColorGradient()),
    ),
    SubCard(
      image: 'https://www.asistar.it/var/ezdemo_site/storage/images/media/images/30-anni-web/11896-1-ita-IT/30-anni-web_hq.jpg',
      subName: 'TWEB',
      profName: 'Matteo Barone',
      time: 'Inizio 16:00',
      startColor: const Color(0xFF2889EB),
      endColor: Color(randomColorGradient()),
    ),
  ];
  return cards;
}





















