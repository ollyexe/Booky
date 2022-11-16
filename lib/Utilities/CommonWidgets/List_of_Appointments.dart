import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/SingleLecture.dart';

Widget space(){
  return const SizedBox(height: 25);
}


Widget listOfAppointments(BuildContext context,Widget widget) {
  return Expanded(
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          singleLecture(context,"Matteo","Barone","Matematica",widget),//Add dinamic number of singleLecture
          space(),
          singleLecture(context,"Matteo","Barone","Matematica",widget),//Add dinamic number of singleLecture
          space(),
          singleLecture(context,"Matteo","Barone","Matematica",widget),//Add dinamic number of singleLecture
          space(),
          singleLecture(context,"Matteo","Barone","Matematica",widget),//Add dinamic number of singleLecture
          space(),
          singleLecture(context,"Matteo","Barone","Matematica",widget),//Add dinamic number of singleLecture
          space(),
        ],
      ),
    ),
  );
}

