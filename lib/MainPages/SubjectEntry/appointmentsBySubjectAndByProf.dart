import 'package:flutter/material.dart';

import '../../Model/Client_API.dart';
import '../../Model/Lecture.dart';
import '../../Utilities/CommonWidgets/CommonStyles.dart';
import '../../Utilities/CommonWidgets/List_of_Appointments.dart';

class appointmentsBySubjectAndByProf extends StatefulWidget {
  String prof;
  String subject;
  appointmentsBySubjectAndByProf(this.prof, this.subject, {Key? key})
      : super(key: key);

  @override
  State<appointmentsBySubjectAndByProf> createState() =>
      _appointmentsBySubjectAndByProfState();
}

class _appointmentsBySubjectAndByProfState
    extends State<appointmentsBySubjectAndByProf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: customAppBar(
          placeholderBack,
          myText("Scegli la lezione", 20,
              Theme.of(context).colorScheme.onPrimary, FontWeight.w500),
          60,
          context),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: FutureBuilder<List<Lecture>>(
          future: Client_API()
              .getLBDoc(widget.prof, widget.subject)
              .then((value) => lectureFromJson(value)),
          builder:
              (BuildContext context, AsyncSnapshot<List<Lecture>> snapshot) {
            if (snapshot.hasData) {
              return (snapshot.hasData
                  ? ListForSubject(snapshot.data!)
                  : const CircularProgressIndicator());
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
