import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import 'package:progettoium/Utilities/CommonWidgets/List_of_Appointments.dart';

import '../Utilities/CommonWidgets/SingleLecture.dart';

class Cart extends StatefulWidget {
  //List<Lecture> list;
  const Cart(/*this.list ,*/{Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Lecture> lectures = [
    Lecture.local("Alessandro","Abrate","Matematica","2022-11-03","17:00",NetworkImage("https://thispersondoesnotexist.com/image"),5,10),
    Lecture.local("Alessandro","Abrate","Matematica","2022-11-03","17:00",NetworkImage("https://thispersondoesnotexist.com/image"),5,10),
  ];
  Text text = myText("Cart", 20, Colors.white, FontWeight.w500);
  String placeOrderText = " Swipe to Place Order";
  Icon placeOrderIcon = const Icon(Icons.arrow_forward);
  Color placeOrderColorContainer = Colors.orange;
  DismissDirection placeOrderDirection = DismissDirection.startToEnd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          customAppBar(placeholder,text,60,context),
          const SizedBox(height: 20),
          ListForCart(lectures),
          const SizedBox(height: 15),
          totalCost(lectures.length,lectures.length*10, context),
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

Widget totalCost(int numberOfLecture, int totalPrice, BuildContext context){
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(10),
    ),
    height: 85,
    width: 290,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        totalCostPart("Number of Lectures ", "$numberOfLecture"),
        Divider(
          thickness: 1,
          height: 10,
          color: Color(0xFFE7E7E7),
        ),
        totalCostPart("Total", "$totalPrice"),
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