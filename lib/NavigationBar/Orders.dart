import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import 'package:progettoium/Utilities/CommonWidgets/List_of_Appointments.dart';

import '../Utilities/CommonWidgets/UtilityWidgets.dart';

var textColors = [Colors.black,Colors.white];
var containerColors = [Colors.white,Colors.purple];
var index=0;

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<bool> isSelected = [false, true];
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [ListOfLectures(bottomPartOrders(),placeholder),ListOfLectures(bottomPartOrders(),placeholder)];
    return Scaffold(
      appBar: customAppBar(placeholder, const Text("Orders"), 75),
      backgroundColor: const Color(0xFFE7E7E7),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 2,
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
        });
        index = newIndex;
      },
      borderRadius: BorderRadius.circular(5),
      selectedColor: Colors.white,
      fillColor: Colors.deepPurple[500],
      color: Colors.black,
      highlightColor: Colors.deepPurple,
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



