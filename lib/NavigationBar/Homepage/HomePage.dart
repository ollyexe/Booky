import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:progettoium/Model/Lecture.dart';
import 'package:progettoium/NavigationBar/Homepage/Selection_Professor_Subject.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import 'package:progettoium/Utilities/CommonWidgets/List_of_Appointments.dart';

import '../../Model/Client_API.dart';
import '../../Utilities/Settings/Settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  refresh() {
    setState(() {});
  }

  nothing() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            customAppBar(
                settingsButton(context),
                myText("IUM Project", 20,
                    Theme.of(context).colorScheme.onPrimary, FontWeight.w500),
                90,
                context), //Custom Widget from MyAppBar.dart file
            const SizedBox(height: 5),
            const SizedBox(height: 5),
            profSubjectButton(
                context), //Custom Widget from Selection_Professor_Subject.dart file
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 75, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                    future: SessionManager().get("nome"),
                    builder: (context, snapshot) {
                      return myText(
                          snapshot.hasData
                              ? "Ciao ${snapshot.data}"
                              : "Ciao Guest",
                          20,
                          Theme.of(context).colorScheme.onBackground,
                          FontWeight.w400);
                    },
                  ),
                  const SizedBox(height: 5),
                  myText(
                      "queste sono le tue prossime lezioni:",
                      17,
                      Theme.of(context).colorScheme.onBackground,
                      FontWeight.w400),
                ],
              ),
            ),
            const SizedBox(height: 10),
            FutureBuilder<List<Lecture>>(
              future: SessionManager().get("email").then((value) => Client_API()
                  .getNextLezioniPrenotate(value)
                  .then((value) => lectureFromJson(value))),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Lecture>> snapshot) {
                if (snapshot.hasData) {
                  return (snapshot.hasData
                      ? ListOfBooks(snapshot.data!, () {})
                      : const CircularProgressIndicator());
                } else {
                  return (!snapshot.hasData
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(color: Colors.black26, width: 1),
                          ),
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5, 10, 0, 10),
                          child: myText("Non ci sono lezioni", 20, Colors.red,
                              FontWeight.bold))
                      : const CircularProgressIndicator());
                }
              },
            ),
          ],
        ));
  }
}

IconButton settingsButton(BuildContext context) {
  return IconButton(
    icon: Icon(Icons.settings_rounded,
        color: Theme.of(context).colorScheme.onPrimary),
    onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const Settings()));
    },
  );
}
