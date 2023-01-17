import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';

import '../../MainPages/ProfessorEntry/byProfessor.dart';
import '../../MainPages/SubjectEntry/bySubject.dart';
import '../../Model/Lecture.dart';

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
      onTap: ()async{
        if(await nullCheck()>0){
          if(label == 'Professors'){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>  byProfessor()));
          }else if(label == 'Subjects'){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>  bySubject()));

          }else{
            //ERROR
          }
        }
        else{
          showDialog(context: context, builder: (BuildContext context){
            return _dialog(context);
          });
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

Future<int> nullCheck() async{
  String json = await getLezioniLibere();
  List<Lecture> l = lectureFromJson(json);

  return l.length;

}



Widget _dialog(BuildContext context) {
  return AlertDialog(
    title: const Text("We are Sorry"),
    content: const Text("There Are no Lectures to book"),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("I undestand"))
    ],
  );
}


Future<String> getLezioniLibere() async{

  Response response = await get(Uri.parse("http://172.20.10.11:9999/servlet_war_exploded/"+
  "apiLezione?path=getLezioniLibere"));


  if (response.statusCode == 200) {




    return  response.body;
  }
  else {
    throw Exception('Unexpected error occured!');
  }
}