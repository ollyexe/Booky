import 'package:flutter/material.dart';
import 'package:progettoium/NavigationBar/Homepage/HomePage.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';

Container myContainer(String label, Color color){
  return Container(
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(7)
    ),
    width: 70,
    height: 30,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(6, 7, 0, 0),
        child: myText(label, 11, Colors.white, FontWeight.bold),
      )
  );
}

class SingleLecture extends StatefulWidget {

  final String name;
  final String surname;
  final String subject;
  final Widget bottomPart;
  late Widget topIcon;
  bool expand;

  SingleLecture(this.name,this.surname,this.subject,this.bottomPart,this.topIcon,this.expand,{Key? key}) : super(key: key);

  @override
  State<SingleLecture> createState() => _SingleLectureState();
}

class _SingleLectureState extends State<SingleLecture> {
  late List<Widget> list = [buildTopPart()];
  bool x = false;
  double height = 105;
  double width = 320;


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



  Widget buildTopPart(){
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
      child: Row(
        children: [
          buildTopLeftPart(),
          const SizedBox(width: 30),
          buildTopCenterPart(widget.name, widget.surname, widget.subject),
          const SizedBox(width: 20),
          buildTopRightPart(widget.topIcon),
        ],
      ),
    );
  }



  /*This part has the Image and the Rating of the professor */
  Widget buildTopLeftPart(){
    return Column(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAbBB_oglMX609dUtMkvQcL3nmKuqOQmVfR2VIj0he6Q&s"),
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
              myText(" 4.7", 15, Colors.white, FontWeight.w600), //CHANGE 4.7 TO A VARIABLE
              const Icon(Icons.star,color: Colors.white,size: 18)],
          ),
        ),
      ],
    );
  }

  /* This part has the data of the professor(name,surname) and the lecture(subject,hour and date) */
  Widget buildTopCenterPart(String name,String surname,String subject){
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
            myContainer("09:00-10:00", Colors.blue),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
              child: myContainer("16/11/2022", Colors.purple),
            )
          ],
        ),
      ],
    );
  }

  /* This part has  the button and the time left to the lecture*/
  Widget buildTopRightPart(Widget button){
    return Column(
      children: [
        button,
        const SizedBox(height: 10),
        myText(" Tra 5 ore", 13, Colors.blueGrey, FontWeight.w500),
      ],
    );
  }

}







