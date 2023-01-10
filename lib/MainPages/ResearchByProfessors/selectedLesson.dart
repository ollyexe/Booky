import 'package:flutter/material.dart';

import '../../Utilities/CommonWidgets/CommonStyles.dart';
import '../../Utilities/CommonWidgets/List_of_Appointments.dart';
import '../../Utilities/CommonWidgets/SingleLecture.dart';

class selectedLesson extends StatefulWidget {
  const selectedLesson({Key? key}) : super(key: key);

  @override
  State<selectedLesson> createState() => _selectedLessonState();
}

class _selectedLessonState extends State<selectedLesson> {
  List<Lecture> lectures = [
    Lecture.local("Alessandro","Abrate","Matematica","2022-11-03","17:00",NetworkImage("https://thispersondoesnotexist.com/image"),5,10),
    Lecture.local("Alessandro","Abrate","Matematica","2022-11-03","17:00",NetworkImage("https://thispersondoesnotexist.com/image"),5,10),
  ];
  Text text = myText("Lezioni disponibili", 20, Colors.white, FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            customAppBar(placeholderBack,text,60,context),
            const SizedBox(height: 20),
            ListForSubject(lectures),
          ],
        )
    );
  }
}
