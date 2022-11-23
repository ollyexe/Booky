import 'package:flutter/material.dart';

import 'CommonStyles.dart';

/* This file has all the files that are passed as they are to SingleLecture */

/*  ------ ------ ------ ------ ------ ------ ------ ------
 *  Here we have all the common widget used for bottomPart
 *  ------ ------ ------ ------ ------ ------ ------ ------
*/

Widget bottomPart(Widget firstWidget,Widget secondWidget){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      firstWidget,
      secondWidget
    ],
  );
}

GestureDetector bottomButtons(Color color,Widget myWidget){
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 60,
      width: 160,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(7)
      ),
      child: myWidget,
    ),
  );
}

/*  ------ ------ ------ ------ ------ ------ ------ ------
 *  From here on we have all the Widget that will be passed
 *  to the bottomPart when it is called from the
 *  HomePage/Calendar
 *  ------ ------ ------ ------ ------ ------ ------ ------
*/


Widget cancelReservationWidget = Padding(
  padding: const EdgeInsetsDirectional.fromSTEB(11, 23, 0, 0),
  child: myText("CANCEL RESERVATION", 13, Colors.white, FontWeight.w600),
);



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

Widget toBeConfirmedLecture = Padding(
  padding: const EdgeInsetsDirectional.fromSTEB(20, 23, 0, 0),
  child: myText("CONFIRM LECTURE", 13, Colors.white, FontWeight.w600),
);


Widget confirmedLecture = Padding(
  padding: const EdgeInsetsDirectional.fromSTEB(10, 23, 0, 0),
  child: myText("ALREADY CONFIRMED", 13, Colors.white, FontWeight.w600),
);
