import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';
import 'package:progettoium/Utilities/CommonWidgets/List_of_Appointments.dart';

import '../Utilities/CommonWidgets/UtilityWidgets.dart';

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
      backgroundColor: const Color(0xFFE7E7E7),
      body: Column(
        children: [
          customAppBar(placeholder,text,60),
          const SizedBox(height: 20),
          ListOfLectures(
            bottomPart(
              placeholder,
              placeholder,
            ),
            removeButton()
          ),
          totalCost("10£",5),
          const SizedBox(height: 5),
          confirmationButton(),
        ],
      )
    );
  }
}



Widget confirmationButton(){
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
    child: GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.orange,
        ),
        width: 270,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            myText("Place Order", 25, Colors.black,FontWeight.w600),
            const Icon(Icons.arrow_forward)
          ],
        ),
      ),
    ),
  );
}


Widget totalCost(String totalCost,int number){
  return Column(
    children: [
      const Divider(height: 10,thickness: 5),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
            child: Column(
              children: [
                myText("Number of appointments:", 18, Colors.black54, FontWeight.w400),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 65, 0),
                  child:myText("Your total is:",25,Colors.black,FontWeight.w500),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
            child: Column(
              children: [
                myText("$number", 18, Colors.black54, FontWeight.w500),
                const SizedBox(height: 20),
                myText(totalCost,25,Colors.black,FontWeight.w600),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
    ],
  );
}

