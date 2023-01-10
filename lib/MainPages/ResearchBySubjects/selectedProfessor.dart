import 'dart:math';
import 'package:flutter/material.dart';
import 'package:progettoium/MainPages/ResearchByProfessors/selectedProfessorSubject.dart';
import 'package:progettoium/MainPages/ResearchBySubjects/selectedSubLesson.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';

import '../../NavigationBar/Homepage/Selection_Professor_Subject.dart';
/*
class selectedProfessor extends StatefulWidget {
  const selectedProfessor({Key? key}) : super(key: key);

  @override
  State<selectedProfessor> createState() => _selectedProfessorState();
}

class _selectedProfessorState extends State<selectedProfessor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: customAppBar(placeholderBack, const Text("Scegli il professore"), 60,context),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: GridView.count(
          crossAxisCount: 2 ,
          children: List.generate(getProfCards().length,(index){
            return Container(
              child: profCard(context, index, getProfCards()),
            );
          }),
        ),
      ),
    );
  }
}

BoxDecoration boxDecoration({double radius = 80.0,  double blurRadius = 8.0, double spreadRadius = 8.0, Color radiusColor = Colors.black12, Gradient? gradient}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      BoxShadow(
        color: radiusColor,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
      ),
    ],
    color: Colors.white,
    gradient: gradient,
  );
}

TextStyle secondaryTextStyle({
  int? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  double? height,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : 14,
    color: color ?? const Color(0xFF757575),
    fontWeight: weight ?? FontWeight.normal,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
    height: height,
  );
}



class ProfCard {
  String? image;
  String? profName;
  String? profSurname;
  String? time;
  List<String>? insegnamenti;
  Color? startColor;
  Color? endColor;
  ProfCard({this.image, this.profName,this.profSurname, this.time,this.insegnamenti, this.startColor, this.endColor});
}


Widget profCard(BuildContext context,int index, List<ProfCard> cards){
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const selectedSubLesson()));
    },
    child: Container(
      margin: const EdgeInsets.all(5),
      height: 270,
      width: 180,
      //padding: const EdgeInsets.all(10),
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
          Text("Prof. ${cards[index].profName!} ${cards[index].profSurname!}", style: secondaryTextStyle(color: Colors.white, size: 17)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cards[index].insegnamenti![0], style: secondaryTextStyle(color: Colors.white54, size: 15)),
              Text(cards[index].insegnamenti![1], style: secondaryTextStyle(color: Colors.white54, size: 15)),
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




int randomColorGradient(){
  List<int> gradients = [0xFFFFDDE1,0xFF7EA56C,0xFF00CDAC,0xFFEA8D8D ,0xFF1EAE98,0xFFBFF098 ,0xFFC33764  ];
  return gradients.elementAt(Random().nextInt(gradients.length));
}



List<ProfCard> getProfCards(){
  //initializtor from json getAllDocenti
  List<ProfCard> cards = [
    ProfCard(
      image: 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Cima_da_Conegliano%2C_God_the_Father.jpg',
      profName: 'Marco',
      profSurname : 'Molica',
      time: 'Sempre Disponibile',
      insegnamenti: ["TWEB","IUM","JAVA","BACKEND"],
      startColor: const Color(0xFF2889EB),
      endColor: Color(randomColorGradient()),
    ),
    ProfCard(
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAbBB_oglMX609dUtMkvQcL3nmKuqOQmVfR2VIj0he6Q&s',
      profName: 'Matteo',
      profSurname: 'Barone',
      time: 'Inizio 16:00',
      insegnamenti: ["Matematica","Algebra","Fisica"],
      startColor: const Color(0xFF2889EB),
      endColor: Color(randomColorGradient()),
    ),
    ProfCard(
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAbBB_oglMX609dUtMkvQcL3nmKuqOQmVfR2VIj0he6Q&s',
      profName: 'Alex',
      profSurname: 'Abrate',
      time: 'Inizio 16:00',
      insegnamenti: ["Matematica","Algebra","Fisica"],
      startColor: const Color(0xFF2889EB),
      endColor: Color(randomColorGradient()),
    ),
    ProfCard(
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAbBB_oglMX609dUtMkvQcL3nmKuqOQmVfR2VIj0he6Q&s',
      profName: 'Mino',
      profSurname: 'Chimento',
      time: 'Inizio 16:00',
      insegnamenti: ["Matematica","Algebra","Fisica"],
      startColor: const Color(0xFF2889EB),
      endColor: Color(randomColorGradient()),
    )
  ];
  return cards;
}
*/
