import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import 'package:progettoium/Utilities/CommonWidgets/List_of_Appointments.dart';

import '../Utilities/CommonWidgets/SingleLecture.dart';
import '../Utilities/CommonWidgets/UtilityWidgets.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Lecture> lectures = [
    Lecture("Alex","Abrate","Matematica",DateTime.now(),null,5.0),
    Lecture("Matteo", "Barone", "Informatica", DateTime.now(), null, 4.0)
  ];
  Text text = myText("Cart", 20, Colors.white, FontWeight.w500);
  String placeOrderText = "Place Order";
  Icon placeOrderIcon = const Icon(Icons.arrow_forward);
  Color placeOrderColorContainer = Colors.orange;
  DismissDirection placeOrderDirection = DismissDirection.startToEnd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      body: Column(
        children: [
          customAppBar(placeholder,text,60),
          const SizedBox(height: 20),
          ListForCart(lectures),
          const SizedBox(height: 15),
          totalCost(),
          const SizedBox(height: 20),
          confirmationButton(),
        ],
      )
    );
  }



  Widget confirmationButton(){
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: placeOrderColorContainer
        ),
        width: 330,
        height: 65,
        clipBehavior: Clip.hardEdge,
        child: Dismissible(
          key: UniqueKey(),
          direction: placeOrderDirection,
          onDismissed: (DismissDirection direction){
            setState(() {
              if(direction == DismissDirection.startToEnd){
                placeOrderIcon = const Icon(Icons.check);
                placeOrderText = "Payment Confirmed";
                placeOrderColorContainer = Colors.green;
                placeOrderDirection = DismissDirection.none;
              }
            });
          },
          background: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green[200]
            ),
            width: 330,
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                myText("Processing", 25, Colors.black,FontWeight.w600),
                const SizedBox(width: 20),
                const CircularProgressIndicator(),
              ],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent
            ),
            width: 330,
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                myText(placeOrderText, 25, Colors.black,FontWeight.w600),
                const SizedBox(width: 20),
                placeOrderIcon
              ],
            ),
          ),
        ),
      ),
    );
  }

}

Widget totalCost(){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    height: 85,
    width: 290,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        totalCostPart("Number of Lectures ", "5"),
        totalCostDivider(),
        totalCostPart("Total", "100€"),
      ],
    ),
  );
}

Row totalCostPart(String label,String total){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
        child: myText(label, 17, Colors.black, FontWeight.w600),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
        child: myText(total, 15, Colors.black, FontWeight.w400),
      )
    ],
  );
}

Divider totalCostDivider(){
  return const Divider(
    thickness: 1,
    height: 10,
    color: Color(0xFFE7E7E7),
  );
}