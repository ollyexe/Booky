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

