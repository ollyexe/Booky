import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import '../../MainPages/ResearchByProfessors/byProfessor.dart';
import '../../MainPages/ResearchBySubjects/BySubject.dart';

Widget profSubjectButton(BuildContext context) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildButton(Icons.school_rounded,'Professors',context),
        buildButton(Icons.science_rounded , 'Subjects',context)
      ]
  );
}

GestureDetector buildButton(IconData icon, String label,BuildContext context){
  return GestureDetector(
      onTap: (){
        if(label == 'Professors'){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const ByProfessor()));
        }else if(label == 'Subjects'){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const BySubject()));
        }else{
          //ERROR
        }
      },
      child: containerWithShadow(Theme.of(context).colorScheme.primaryContainer, 80, 150, buttonElements(icon, label,context),context)
  );
}

Column buttonElements(IconData icon, String label, BuildContext context){
  return Column(
    children: [
      const SizedBox(height: 10),
      Icon(
        icon,
        color: label == 'Subjects' ?  Colors.green : Colors.red,
      ),
      const SizedBox(height: 8),
      myText(label, 16, Theme.of(context).colorScheme.onPrimaryContainer, FontWeight.w400)
    ],
  );
}





