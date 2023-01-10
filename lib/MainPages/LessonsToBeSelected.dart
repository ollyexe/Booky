import 'package:flutter/material.dart';
import '../Utilities/CommonWidgets/CommonStyles.dart';
import '../Utilities/CommonWidgets/List_of_Appointments.dart';
import '../Utilities/CommonWidgets/SingleLecture.dart';

class LessonsToBeSelected extends StatefulWidget {
  const LessonsToBeSelected({Key? key}) : super(key: key);

  @override
  State<LessonsToBeSelected> createState() => _LessonsToBeSelectedState();
}

class _LessonsToBeSelectedState extends State<LessonsToBeSelected> {
  List<Lecture> lectures = [
    Lecture.local("Alessandro","Abrate","Matematica","2022-11-03","17:00",NetworkImage("https://thispersondoesnotexist.com/image"),5,10),
    Lecture.local("Alessandro","Abrate","Matematica","2022-11-03","17:00",NetworkImage("https://thispersondoesnotexist.com/image"),5,10),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            customAppBar(placeholderBack,myText("Lezioni disponibili", 20, Theme.of(context).colorScheme.onPrimary, FontWeight.w500),60,context),
            const SizedBox(height: 20),
            ListForSubject(lectures),
          ],
        )
    );
  }
}
