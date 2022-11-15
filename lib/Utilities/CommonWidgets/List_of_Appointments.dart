import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import 'package:progettoium/Utilities/CommonWidgets/SingleLecture.dart';

Widget listOfAppointments(BuildContext context,Widget widget) {
  return Expanded(
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          singleLecture(context,"Matteo","Barone","Matematica",widget),//Add dinamic number of singleLecture
          space,
          singleLecture(context,"Matteo","Barone","Matematica",widget),//Add dinamic number of singleLecture
          space,
          singleLecture(context,"Matteo","Barone","Matematica",widget),//Add dinamic number of singleLecture
          space,
          singleLecture(context,"Matteo","Barone","Matematica",widget),//Add dinamic number of singleLecture
          space,
          singleLecture(context,"Matteo","Barone","Matematica",widget),//Add dinamic number of singleLecture
          space
        ],
      ),
    ),
  );
}

SizedBox space =  const SizedBox(height:15);