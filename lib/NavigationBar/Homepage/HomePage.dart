import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import 'package:progettoium/Utilities/CommonWidgets/List_of_Appointments.dart';
import 'package:progettoium/NavigationBar/Homepage/Selection_Professor_Subject.dart';
import 'package:progettoium/Utilities/CommonWidgets/SingleLecture.dart';

import '../../Utilities/Settings/Settings.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Lecture> lectures = [
    Lecture("Alex","Abrate","Matematica",DateTime.now(),null,5.0),
    Lecture("Matteo", "Barone", "Informatica", DateTime.now(), null, 4.0)
  ];
  String name = "Matteo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      body: Column(
        children: [
          customAppBar(settingsButton(context),myText("IUM Project", 20, Colors.white, FontWeight.w500),90), //Custom Widget from MyAppBar.dart file
          const SizedBox(height: 35),
          profSubjectButton(context), //Custom Widget from Selection_Professor_Subject.dart file
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 75, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 157, 0),
                  child: myText("Ciao $name,", 20, Colors.black, FontWeight.w400),
                ),
                const SizedBox(height: 5),
                myText("queste sono le tue prossime lezioni:", 17, Colors.black, FontWeight.w400),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ListOfLectures(lectures), //Custom Widget from List_Of_Appointments.dart, found in the Utilities/CommonWidgets
        ],
      )
    );
  }
}


IconButton settingsButton(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.settings_rounded),
    onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const Settings()));
    },
  );
}

