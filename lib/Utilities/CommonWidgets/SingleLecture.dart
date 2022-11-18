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

Widget space(){
  return const SizedBox(height: 25);
}

Widget singleLecture(BuildContext context, String name, String surname, String subject,Widget widget){
  double height=105;
  double width=320;
  return GestureDetector(
    onTap: () {},
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.black26, width: 1),
      ),
      height: height,
      width: width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 14, 0, 0),
            child: Row(
              children: [
                const Icon(Icons.person),
                const SizedBox(width: 10),
                Column(
                  children: [
                    myText("Prof. $name $surname", 17, Colors.black, FontWeight.bold),
                    myText(subject, 13, Colors.grey, FontWeight.w500),
                  ],
                ),
                const SizedBox(width: 70),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: widget,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(150, 5, 0, 0),
            child: Row(
              children: [
                myContainer("09:00-10:00", Colors.blue),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                  child: myContainer("16/11/2022", Colors.purple),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
