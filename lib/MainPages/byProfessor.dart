import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/SingleLecture.dart';

import '../NavigationBar/Homepage/MyAppBar.dart';
import '../Utilities/CommonWidgets/CommonStyles.dart';

class ByProfessor extends StatefulWidget {
  const ByProfessor({Key? key}) : super(key: key);

  @override
  State<ByProfessor> createState() => _ByProfessorState();
}

class _ByProfessorState extends State<ByProfessor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scegli il professore"),
        backgroundColor: const Color(0xFF3B5998),

      ),


      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => space,
          scrollDirection: Axis.vertical,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                profCard(context, index, cards),
                profCard(context, index+1, cards),
              ],
            );
          },
        ),
      ),
    );
  }
}


List<SDExamCardModel> cards = [
  SDExamCardModel(
    image: 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Cima_da_Conegliano%2C_God_the_Father.jpg',
    profName: 'Marco',
    profSurname : 'Molica',
    time: 'Sempre Disponibile',
    insegnamenti: ["TWEB","IUM","JAVA","BACKEND"],
    startColor: Color(0xFF2889EB),
    endColor: Color(0xFF0B56CB),
  ),
  SDExamCardModel(
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAbBB_oglMX609dUtMkvQcL3nmKuqOQmVfR2VIj0he6Q&s',
    profName: 'Matteo',
    profSurname: 'Barone',
    time: 'Inizio 16:00',
    insegnamenti: ["Matematica","Algebra","Fisica"],
    startColor: Color(0xFFF1AD4B),
    endColor: Color(0xFFF26340),
  ),
  SDExamCardModel(
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAbBB_oglMX609dUtMkvQcL3nmKuqOQmVfR2VIj0he6Q&s',
    profName: 'Alex',
    profSurname: 'Abrate',
    time: 'Inizio 16:00',
    insegnamenti: ["Matematica","Algebra","Fisica"],
    startColor: Color(0xFF7EA56C),
    endColor: Color(0xFF6C9258),
  )
];


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
    fontSize: size != null ? size.toDouble() : textSecondarySizeGlobal,
    color: color ?? textSecondaryColorGlobal,
    fontWeight: weight ?? fontWeightSecondaryGlobal,
    fontFamily: fontFamily ?? fontFamilySecondaryGlobal,
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




class SDExamCardModel {
  String? image;
  String? profName;
  String? profSurname;
  String? time;
  List<String>? insegnamenti;
  Color? startColor;
  Color? endColor;
  SDExamCardModel({this.image, this.profName,this.profSurname, this.time,this.insegnamenti, this.startColor, this.endColor});
}


Color textPrimaryColorGlobal = textPrimaryColor;
Color textSecondaryColorGlobal = textSecondaryColor;
double textBoldSizeGlobal = 16;
double textPrimarySizeGlobal = 16;
double textSecondarySizeGlobal = 14;
String? fontFamilyBoldGlobal;
String? fontFamilyPrimaryGlobal;
String? fontFamilySecondaryGlobal;
FontWeight fontWeightBoldGlobal = FontWeight.bold;
FontWeight fontWeightPrimaryGlobal = FontWeight.normal;
FontWeight fontWeightSecondaryGlobal = FontWeight.normal;
const textPrimaryColor = Color(0xFF2E3033);
const textSecondaryColor = Color(0xFF757575);




Widget profCard(BuildContext context,int index, List<SDExamCardModel> cards){
  return GestureDetector(
    onTap: () {

    },
    child: Container(
      margin: EdgeInsets.all(5),
      width: 180.0,
      height: 250,

      padding: EdgeInsets.all(10),
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
          Text("Prof. "+cards[index].profName!+" "+cards[index].profSurname!, style: secondaryTextStyle(color: Colors.white, size: 17)),
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




