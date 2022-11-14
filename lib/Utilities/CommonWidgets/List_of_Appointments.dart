import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/SingleLecture.dart';

Widget listOfAppointments(BuildContext context) {
  return Expanded(
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          singleLecture(context,"Matteo","Barone","Matematica"),//Add dinamic number of singleLecture
        ],
      ),
    ),
  );
}
