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
  String selectedValue = "USA";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     showDialog(
      //         context: context,
      //         builder: (BuildContext context) {
      //           return AlertDialog(
      //             title: const Text("Filtra le tue lezioni",
      //                 style: TextStyle(fontSize: 20)),
      //             content: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               children: [
      //                 DropdownButton(
      //                     value: selectedValue,
      //                     onChanged: (String? newValue){
      //                       print(selectedValue);
      //                       setState(() {
      //                         selectedValue = newValue!;
      //                       });
      //                       print(selectedValue);
      //
      //                     },
      //                     items: dropdownItems
      //                 ),
      //               ],
      //             ),
      //             actions: <Widget>[
      //               ButtonBar(
      //                 children: [
      //                   ElevatedButton(
      //                     onPressed: () {},
      //                     child: const Text(
      //                       "Cancell",
      //                       style: TextStyle(fontSize: 18,color: Colors.red),
      //                     ),
      //                     style: ButtonStyle(
      //                         shape: MaterialStateProperty.all<
      //                                 RoundedRectangleBorder>(
      //                             RoundedRectangleBorder(
      //                                 borderRadius: BorderRadius.circular(18.0),
      //                                 side: BorderSide(color: Colors.red)))),
      //                   ),
      //                   ElevatedButton(
      //                     onPressed: () {},
      //                     child: const Text(
      //                       "Filter",
      //                       style: TextStyle(fontSize: 18,color: Colors.white),
      //                     ),
      //                     style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue)),
      //                   )
      //                 ],
      //               )
      //             ],
      //           );
      //         });
      //   },
      //   backgroundColor: Colors.blue,
      //   label: const Text("Filtra",
      //       style: TextStyle(color: Colors.white, fontSize: 18)),
      //   icon: const Icon(Icons.filter_alt_sharp, color: Colors.white),
      //   shape: const RoundedRectangleBorder(
      //       borderRadius: BorderRadius.all(
      //     Radius.circular(35.0),
      //   )),
      // ),
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


List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("USA"),value: "USA"),
    DropdownMenuItem(child: Text("Canada"),value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
    DropdownMenuItem(child: Text("England"),value: "England"),
  ];
  return menuItems;
}

