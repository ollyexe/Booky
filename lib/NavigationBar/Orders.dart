import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import 'package:progettoium/Utilities/CommonWidgets/List_of_Appointments.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(21, 90, 0, 0),
        child: Column(
          children: [
            listOfAppointments(context),
          ],
        ),
      )
    );
  }
}
