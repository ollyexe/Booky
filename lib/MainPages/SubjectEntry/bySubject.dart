import 'package:flutter/material.dart';
import 'package:progettoium/MainPages/SubjectEntry/SubjectCardS.dart';

import '../../Model/Client_API.dart';
import '../../Model/Subjects.dart';
import '../../Utilities/CommonWidgets/CommonStyles.dart';

class bySubject extends StatefulWidget {
  bySubject({Key? key}) : super(key: key);

  @override
  State<bySubject> createState() => _bySubject();
}

class _bySubject extends State<bySubject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: customAppBar(
          placeholderBack,
          myText("Scegli la materia", 20,
              Theme.of(context).colorScheme.onPrimary, FontWeight.w500),
          60,
          context),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: FutureBuilder<Subjects>(
          future: Client_API()
              .getAllSubj()
              .then((value) => subjectsFromJson(value)),
          builder: (BuildContext context, AsyncSnapshot<Subjects> snapshot) {
            if (snapshot.hasData) {
              return (snapshot.hasData
                  ? GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(
                          snapshot.data!.corsi.length,
                          (index) =>
                              subCardS(context, snapshot.data!.corsi[index])))
                  : const CircularProgressIndicator());
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
