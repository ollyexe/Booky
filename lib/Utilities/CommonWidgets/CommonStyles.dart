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

AppBar customAppBar(Widget widget,Text text,double height){
  return AppBar(
    backgroundColor: const Color(0xFF3B5998),
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

Widget divider = const Divider(
  height: 1.0,
  thickness: 2,
  indent: Checkbox.width,
  endIndent: Checkbox.width,
);

RotatedBox arrowRight(bool rotateArrow){
  return RotatedBox(
    key: const Key("ArrowThatRotates"),
    quarterTurns: rotateArrow ? 1 : 0,
    child: const Icon(
      Icons.arrow_right,
      size: 40,
    ),
  );
}

class RightArrow extends StatefulWidget {
  final bool rotateArrow;
  const RightArrow(this.rotateArrow,{Key? key}) : super(key: key);

  @override
  State<RightArrow> createState() => _RightArrowState();
}

class _RightArrowState extends State<RightArrow> {
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      key: const Key("ArrowThatRotates"),
      quarterTurns: widget.rotateArrow ? 1 : 0,
      child: const Icon(
        Icons.arrow_right,
        size: 40,
      ),
    );
  }
}

