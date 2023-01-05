import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/List_of_Appointments.dart';
import 'package:table_calendar/table_calendar.dart';
import '../Utilities/CommonWidgets/CommonStyles.dart';
import '../Utilities/CommonWidgets/SingleLecture.dart';
import '../Utilities/CommonWidgets/UtilityWidgets.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);


  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
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
          const SizedBox(height: 30),
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2021,01,01),
            lastDay: DateTime.utc(2023,12,31),
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            onFormatChanged: (newFormat) {
              setState(() {
                _calendarFormat = newFormat;
              });
            },
          ),
          const SizedBox(height: 30),
          ListOfLectures(lectures),
        ],
      ),
    );
  }
}
