import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import 'package:progettoium/Utilities/CommonWidgets/List_of_Appointments.dart';

import '../Model/Client_API.dart';
import '../Model/Lecture.dart';

var textColors = [Colors.black, Colors.white];
var containerColors = [Colors.white, Colors.purple];

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(placeholder,
            myText("Orders", 23, Colors.white, FontWeight.w500), 75, context),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(children: [
          myText("To Be Confirmed", 20, Colors.black, FontWeight.bold),
          FutureBuilder<List<Lecture>>(
            future: SessionManager().get("email").then((value) => Client_API()
                .getLezioniDaConfermare(value)
                .then((value) => lectureFromJson(value))),
            builder:
                (BuildContext context, AsyncSnapshot<List<Lecture>> snapshot) {
              if (snapshot.hasData) {
                return (snapshot.hasData
                    ? ListOfLectures(snapshot.data!, refresh)
                    : const CircularProgressIndicator());
              } else {
                return (snapshot.hasData
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26, width: 1),
                        ),
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
                        child: myText("Non ci sono lezioni", 20, Colors.red,
                            FontWeight.bold))
                    : const CircularProgressIndicator());
              }
            },
          ),
          myText("Confirmed", 20, Colors.black, FontWeight.bold),
          FutureBuilder<List<Lecture>>(
            future: SessionManager().get("email").then((value) => Client_API()
                .getLezioniFinite(value)
                .then((value) => lectureFromJson(value))),
            builder:
                (BuildContext context, AsyncSnapshot<List<Lecture>> snapshot) {
              if (snapshot.hasData) {
                return (snapshot.hasData
                    ? ListForRating(snapshot.data!, refresh)
                    : const CircularProgressIndicator());
              } else {
                return (snapshot.hasData
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.black26, width: 1),
                        ),
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 10),
                        child: myText("Non ci sono lezioni", 20, Colors.red,
                            FontWeight.bold))
                    : const CircularProgressIndicator());
              }
            },
          ),
        ]));
  }
}
