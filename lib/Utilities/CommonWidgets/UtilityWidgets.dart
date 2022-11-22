import 'package:flutter/material.dart';

import 'CommonStyles.dart';

/* This file has all the files that are passed as they are to SingleLecture */




/*  ------ ------ ------ ------ ------ ------ ------ ------
 *  From here on we have all the Widget that will be passed
 *  to the ListOfLecture constructor when it is called from
 *  the HomePage/Calendar
 *  ------ ------ ------ ------ ------ ------ ------ ------
*/
Widget bottomPartHomePage(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: () {},
        child: Container(
          height: 60,
          width: 160,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(7)
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(14, 24, 0, 0),
            child: myText("CANCEL RESERVATION", 12, Colors.white, FontWeight.w600),
          )
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: Container(
          height: 60,
          width: 160,
            decoration: BoxDecoration(
                color: const Color(0xFF33B964),
                borderRadius: BorderRadius.circular(7)
            ),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.calendar_month_rounded,
                  size: 45,
                  color: Colors.white,
                )
            )
        ),
      )
    ],
  );
}

Icon arrowRight = const Icon(
  Icons.arrow_right,
  size: 40,
);

/*  ------ ------ ------ ------ ------ ------ ------ ------
 *  From here on we have all the Widget that will be passed
 *  to the ListOfLecture constructor when it is called from
 *  the Cart
 *  ------ ------ ------ ------ ------ ------ ------ ------
*/
Widget buildPartCart(){
  return Row(
    children: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.event,
            size: 40,
            color: Colors.blue,
          )
      ),
      const SizedBox(width: 20),
      FloatingActionButton(
        onPressed: (){},
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white
          ),
          child: myText("Prova2", 8, Colors.black, FontWeight.w400),
        ),
      )
    ],
  );
}

IconButton removeButton() {
  return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.highlight_remove_rounded,
        size: 40,
        color: Colors.red,
      )
  );
}

/*  ------ ------ ------ ------ ------ ------ ------ ------
 *  From here on we have all the Widget that will be passed
 *  to the ListOfLecture constructor when it is called from
 *  the Orders.dart file
 *  ------ ------ ------ ------ ------ ------ ------ ------
*/
Widget bottomPartOrders(){
  return Row(
    children: [
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.event,
            size: 40,
            color: Colors.blue,
          )
      ),
      const SizedBox(width: 20),
      FloatingActionButton(
        onPressed: (){},
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white
          ),
          child: myText("Orders", 8, Colors.black, FontWeight.w400),
        ),
      )
    ],
  );
}
