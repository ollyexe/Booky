import 'package:flutter/material.dart';

/* This file contains some useful widget, used in different context */


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

Container containerWithShadow(Color boxColor,double height,double width, Widget widget, BuildContext context){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: boxColor,
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.shadow,
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

AppBar customAppBar(Widget widget,Text text,double height,BuildContext context){
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.primary,
    elevation: 0,
    title: text,
    toolbarHeight: height,
    actions: [
      widget
    ],
  );
}

SizedBox placeholder = const SizedBox(width: 0, height: 0);

Widget space = const SizedBox(height: 25);

Widget divider(Color color){
  return Divider(
      height: 1.0,
      thickness: 2,
      indent: Checkbox.width,
      endIndent: Checkbox.width,
      color: color,
  );
}

Container containerSingleLecture(String label, Color color, BuildContext context){
  return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(7)
      ),
      width: 80,
      height: 30,
      child: Center(child: myText(label, 11, Theme.of(context).colorScheme.onTertiaryContainer, FontWeight.bold))
  );
}



