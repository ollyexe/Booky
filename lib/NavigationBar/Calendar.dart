import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:progettoium/Utilities/CommonWidgets/List_of_Appointments.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Model/Client_API.dart';
import '../Model/Lecture.dart';
import '../Utilities/CommonWidgets/CommonStyles.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const SizedBox(height: 30),
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2021, 01, 01),
            lastDay: DateTime.utc(2023, 12, 31),
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
          FutureBuilder<List<Lecture>>(
            future: SessionManager().get("email").then((value) => Client_API()
                .getLexByDayAndUtente(
                    value,
                    _selectedDay!.year.toString(),
                    _selectedDay!.month.toString(),
                    _selectedDay!.day.toString())
                .then((value) => lectureFromJson(value))),
            builder:
                (BuildContext context, AsyncSnapshot<List<Lecture>> snapshot) {
              if (snapshot.data != null) {
                return (snapshot.hasData
                    ? ListOfLectures(snapshot.data!, () {})
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
                            20, 10, 20, 10),
                        child: myText("Non ci sono lezioni", 20, Colors.red,
                            FontWeight.bold))
                    : const CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
