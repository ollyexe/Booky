import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import 'package:progettoium/Utilities/CommonWidgets/List_of_Appointments.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Text text = myText("Cart", 20, Colors.white, FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(placeholder,text),
          const SizedBox(height: 20),
          listOfAppointments(context,removeButton()),
          const SizedBox(height: 15),
          confirmationButton(),
        ],
      )
    );
  }
}

IconButton removeButton() {
  return IconButton(
    onPressed: () {},
    icon: const Icon(
      Icons.highlight_remove_rounded,
      color: Colors.red,
    )
  );
}

Widget confirmationButton(){
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
    child: GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.yellow,
        ),
        width: 300,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            myText("Prenota", 25, Colors.black,FontWeight.w600),
            const Icon(Icons.arrow_forward)
          ],
        ),
      ),
    ),
  );
}

