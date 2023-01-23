import 'package:flutter/material.dart';

import '../../Model/Client_API.dart';
import '../../Model/Lecture.dart';
import '../../Utilities/CommonWidgets/CommonStyles.dart';
import '../../Utilities/CommonWidgets/List_of_Appointments.dart';

class appointmentsByProfAndBySubject extends StatefulWidget {
  String prof;
  String subject;
  appointmentsByProfAndBySubject(this.prof, this.subject, {Key? key})
      : super(key: key);

  @override
  State<appointmentsByProfAndBySubject> createState() =>
      _appointmentsByProfAndBySubjectState();
}

class _appointmentsByProfAndBySubjectState
    extends State<appointmentsByProfAndBySubject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: customAppBar(
          arrowBackNoWait,
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
