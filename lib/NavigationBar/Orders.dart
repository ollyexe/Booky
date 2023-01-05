import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import 'package:progettoium/Utilities/CommonWidgets/List_of_Appointments.dart';
import '../Utilities/CommonWidgets/SingleLecture.dart';

var textColors = [Colors.black,Colors.white];
var containerColors = [Colors.white,Colors.purple];
var index=0;

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<Lecture> lectures = [
    Lecture.local("Alessandro","Abrate","Matematica","2022-11-03","17:00",NetworkImage("https://thispersondoesnotexist.com/image"),5,10),

  ];
  List<bool> isSelected = [false, true];
  List<Widget> screens = [];

  @override
  void initState() {
    super.initState();
    screens = [ListOfLectures(lectures), ListOfLectures(lectures)];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(placeholder, myText("Orders", 23, Colors.white, FontWeight.w500),75,context),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.shadow,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(1, 2)
                  ),
                ]
              ),
              child: buttons(),
            ),
            const SizedBox(height: 30),
            screens[index],
          ],
        ),
      )
    );
  }
  Widget buttons(){
    return ToggleButtons(
      onPressed: (int newIndex) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            isSelected[i] = i == newIndex;
          }
          index = newIndex;
        });
      },
      borderRadius: BorderRadius.circular(5),
      selectedColor: Theme.of(context).colorScheme.onTertiaryContainer,
      fillColor: Theme.of(context).colorScheme.tertiaryContainer,
      color: Theme.of(context).colorScheme.onSecondaryContainer,
      highlightColor: Theme.of(context).colorScheme.tertiaryContainer,
      constraints: const BoxConstraints(
        minHeight: 70.0,
        minWidth: 150.0,
      ),
      isSelected: isSelected,
      children: const [
        Text("Pending"),
        Text("Confirmed"),
      ],
    );
  }
}





