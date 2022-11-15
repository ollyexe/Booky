import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import '../../MainPages/byProfessor.dart';
import '../../MainPages/BySubject.dart';

Widget profSubjectButton(BuildContext context) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildButton(Colors.orange,Icons.school_rounded,'Professors',context),
        buildButton(Colors.green,Icons.science_rounded , 'Subjects',context)
      ]
  );
}

GestureDetector buildButton(Color color, IconData icon, String label,BuildContext context){
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
      child: containerWithShadow(Colors.white, 80, 150, buttonElements(icon, label, color))
  );
}


Column buttonElements(IconData icon, String label, Color color){
  return Column(
    children: [
      const SizedBox(height: 10),
      Icon(
        icon,
        color: color,
      ),
      const SizedBox(height: 8),
      myText(label, 16, Colors.black, FontWeight.w400)
    ],
  );
}





