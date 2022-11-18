import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/SingleLecture.dart';



Widget listOfSomething(BuildContext context, Widget widget){
  return Expanded(
    child: ListView.separated(
      separatorBuilder: (context, index) => space(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context,int index){
        return singleLecture(context,"Matteo","Barone","Matematica",widget);

      },
    )
  );
}

