import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';

class Lecture{
  String name;
  String surname;
  String subject;
  DateTime date;
  NetworkImage? image;
  double? rating;

  Lecture(this.name,this.surname,this.subject,this.date,this.image,this.rating);
}

class TopWidget extends StatefulWidget {

  Lecture lecture;

  TopWidget(this.lecture,{Key? key}) : super(key: key);

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {

  /*
  @override
  void initState() {
    super.initState();
    widget.lecture.name = "Matteo";
    widget.lecture.surname = "Barone";
    widget.lecture.image = const NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAbBB_oglMX609dUtMkvQcL3nmKuqOQmVfR2VIj0he6Q&s");
    widget.lecture.date = DateTime(1970,01,01,00,00,00);
    widget.lecture.rating = 0.0;
  }
   */
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildTopLeftPart(widget.lecture.image,widget.lecture.rating),
        const SizedBox(width: 30),
        buildTopCenterPart(widget.lecture.name,widget.lecture.surname,widget.lecture.subject,widget.lecture.date),
        const SizedBox(width: 20),
        Column(
          children: [
            const SizedBox(height: 10),
            myText(" Tra 5 ore", 13, Colors.blueGrey, FontWeight.w500),
          ],
        )
      ],
    );
  }
}




/*This part has the Image and the Rating of the professor */
Widget buildTopLeftPart(NetworkImage? image, double? rating){
  return Column(
    children: [
      CircleAvatar(
        backgroundImage: image,
        radius: 25,
      ),
      const SizedBox(height:5),
      Container(
        decoration:BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(7)
        ),
        child: Row(
          children: [
            myText("$rating", 15, Colors.white, FontWeight.w600), //CHANGE 4.7 TO A VARIABLE
            const Icon(Icons.star,color: Colors.white,size: 18)],
        ),
      ),
    ],
  );
}

/* This part has the data of the professor(name,surname) and the lecture(subject,hour and date) */
Widget buildTopCenterPart(String name,String surname,String subject,DateTime date){
  return Column(
    children: [
      Column(
        children: [
          myText("Prof. $name $surname", 17, Colors.black, FontWeight.bold),
          myText(subject, 13, Colors.grey, FontWeight.w500),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          containerSingleLecture("${date.hour}:${date.minute} - ${date.hour+1}:${date.minute}", Colors.blue),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
            child: containerSingleLecture("${date.day}/${date.month}/${date.year}", Colors.purple),
          )
        ],
      ),
    ],
  );
}






/*
class SingleLecture extends StatefulWidget {

  final String name;
  final String surname;
  final String subject;
  final Widget bottomPart;
  late String topIcon;
  final bool expand;

  SingleLecture(this.name,this.surname,this.subject,this.bottomPart,this.topIcon,this.expand,{Key? key}) : super(key: key);

  @override
  State<SingleLecture> createState() => _SingleLectureState();
}

class _SingleLectureState extends State<SingleLecture> {

  late List<Widget> list = [];
  bool x = false;
  double height = 105;
  double width = 320;
  late Widget topRightIcon;
  late Widget topPart;

  @override
  void initState() {
    super.initState();
    if(widget.topIcon == "RightArrow"){
      topRightIcon = RightArrow(switchValue: false, valueChanged: (value) {
      },);
    }else if(widget.topIcon == "Bin"){
      topRightIcon = removeButton();
    }
    list.add(topPart);
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          if(x==false && widget.expand==true){
            height = 200;
            list.add(widget.bottomPart);
            x = true;
          }else if(x==true && widget.expand==true){
            height = 105;
            list.remove(widget.bottomPart);
            x = false;
            topRightIcon = arrowRight(true);
          }else{

          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 270),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.black26, width: 1),
        ),
        height: height,
        width: width,
        child: ListView.separated(
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
          separatorBuilder: (context, index) => space,
          itemCount: x ? 2 : 1,
          itemBuilder: (context, index) {
            return list[index];
          },
        ),
      ),
    );
  }


}
 */
