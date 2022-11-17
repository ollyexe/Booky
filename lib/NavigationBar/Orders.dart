import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import 'package:progettoium/Utilities/CommonWidgets/List_of_Appointments.dart';

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
    List<Widget> screens = [listOfAppointments(context, placeholder),listOfAppointments(context, placeholder)];
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(17, 50, 0, 0),
        child: Column(
          children: [
            ToggleButtons(
              onPressed: (int newIndex) {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = i == newIndex;
                  }
                });
                index = newIndex;
              },
              selectedBorderColor: Colors.black38,
              selectedColor: Colors.white,
              fillColor: Colors.purple,
              color: Colors.black,
              highlightColor: Colors.purple,
              constraints: const BoxConstraints(
                minHeight: 70.0,
                minWidth: 150.0,
              ),
              isSelected: isSelected,
              children: const [
                Text("Pending"),
                Text("Confirmed"),
              ],
            ),
            const SizedBox(height: 30),
            screens[index],
          ],
        ),
      )
    );
  }
}

