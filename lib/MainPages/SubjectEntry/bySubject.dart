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
          arrowBackNoWait,
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
                  ? (snapshot.data!.corsi.length!=0?GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                      snapshot.data!.corsi.length,
                          (index) =>
                          subCardS(context, snapshot.data!.corsi[index]))):Row(
                mainAxisAlignment:MainAxisAlignment.center ,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.black26, width: 1),
                      ),
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          5, 10, 0, 10),
                      child: myText("Non ci sono lezioni", 20, Colors.red,
                          FontWeight.bold)),
                ],
              ))
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
