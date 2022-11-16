import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import 'package:progettoium/Utilities/CommonWidgets/List_of_Appointments.dart';

Color color = Colors.blue;

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(17, 50, 0, 0),
        child: pendingConfirmed(context)
      )
    );
  }
}

Column pendingConfirmed(BuildContext context){
  return Column(
    children: [
      filterRow(),
      const SizedBox(height: 30),
      listOfAppointments(context,placeholder),
    ],
  );
}

Row filterRow(){
  return Row(
    children: [
      filterConfirmed("Pending", color),
      filterConfirmed("Confirmed", color),
    ],
  );
}

GestureDetector filterConfirmed(String label,Color color){
  return GestureDetector(
    onTap: () {
      
    },
    child: Container(
      decoration: BoxDecoration(
        color: color,
      ),
      height: 330,
      width: 45,
      child: myText(label, 20, color, FontWeight.w400),
    ),
  );
}