import 'package:flutter/material.dart';



Text myText(String label, double fontSize, Color color, FontWeight fontWeight){
  return Text(
    label,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}

Container containerWithShadow(Color boxColor,double height,double width, Widget widget){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: boxColor,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(2, 3)
        ),
      ]
    ),
    height: height,
    width: width,
    child: widget,
  );
}

AppBar customAppBar(Widget widget,Text text){
  return AppBar(
    backgroundColor: const Color(0xFF3B5998),
    elevation: 0,
    title: text,
    toolbarHeight: 90,
    actions: [
      widget
    ],
  );
}

SizedBox placeholder = const SizedBox(width: 0, height: 0);

