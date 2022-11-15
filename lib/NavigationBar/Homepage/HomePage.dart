import 'package:flutter/material.dart';
import 'package:progettoium/NavigationBar/Homepage/MyAppBar.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import 'package:progettoium/Utilities/CommonWidgets/List_of_Appointments.dart';
import 'package:progettoium/NavigationBar/Homepage/Selection_Professor_Subject.dart';

import '../../Utilities/Settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "Matteo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          header(context), //Custom Widget from MyAppBar.dart file
          const SizedBox(height: 35),
          profSubjectButton(context), //Custom Widget from Selection_Professor_Subject.dart file
          const SizedBox(height: 30),
          myText("Ciao $name,", 20, Colors.black, FontWeight.w400),
          myText("queste sono le tue prossime lezioni:", 17, Colors.black, FontWeight.w400),
          const SizedBox(height: 20),
          listOfAppointments(context,placeholder), //Custom Widget from List_Of_Appointments.dart, found in the Utilities/CommonWidgets

        ],
      )
    );
  }
}
