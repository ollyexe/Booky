import 'package:flutter/material.dart';
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
  final Widget button;
  final String name;
  final String surname;
  final String subject;


  const SingleLecture(this.button,this.name,this.surname,this.subject,{Key? key}) : super(key: key);

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
          if(height == 105){
            height = 200;
            list.add(
              buildBottomPart()
            );
            x = true;
          }else{
            height = 105;
            list.remove(
              buildBottomPart()
            );
            x = false;
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 370),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.black26, width: 1),
        ),
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
          child: ListView.separated(
            separatorBuilder: (context, index) => space,
            itemCount: x==true ? 2 : 1,
            itemBuilder: (context, index) {
              return list[index];
            },
          ),
        )
      ),
    );
  }

  Widget buildTopPart(){
    return Row(
      children: [
        buildLeftPart(),
        buildCenterPart(widget.name, widget.surname, widget.subject),
        buildRightPart(widget.button),
      ],
    );
  }



  Widget buildBottomPart(){
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.event,
            size: 40,
            color: Colors.blue,
          )
        ),
        const SizedBox(width: 20),
        FloatingActionButton(
          onPressed: (){},
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: myText("Ciao", 8, Colors.black, FontWeight.w400),
            ),
          ),
        )
      ],
    );
  }

  /*This part has the Image and the Rating of the professor */
  Widget buildLeftPart(){
    return Column(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAbBB_oglMX609dUtMkvQcL3nmKuqOQmVfR2VIj0he6Q&s"),
          radius: 25,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
          child: Container(
            decoration:BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(7)
            ) ,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                myText(" 4.7", 15, Colors.white, FontWeight.w600), //CHANGE 4.7 TO A VARIABLE
                const Icon(Icons.star,color: Colors.white,size: 18,)],
            ),
          ),
        )
      ],
    );
  }

  /* This part has the data of the professor(name,surname) and the lecture(subject,hour and date) */
  Widget buildCenterPart(String name,String surname,String subject){
    return Padding(
      padding: const EdgeInsets.fromLTRB(45, 0, 20, 0),
      child: Column(
        children: [
          Column(
            children: [
              myText("Prof. $name $surname", 17, Colors.black, FontWeight.bold),
              myText(subject, 13, Colors.grey, FontWeight.w500),
            ],
          ),
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
      ),
    );
  }

  /* This part has  */
  Widget buildRightPart(Widget button){
    return Column(
      children: [
        button,
        const SizedBox(height: 5),
        myText(" Tra 5 ore", 13, Colors.blueGrey, FontWeight.w500),
      ],
    );
  }

}







