import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';

Widget singleLecture(BuildContext context, String name, String surname, String subject,Widget widget){
  return GestureDetector(
    onTap: () {
      /* Vai alla pagina con i tasti per annullarla/spostarla */
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey
      ),
      height: 100,
      width: 350,
      child: Row(
        children: [
          myText(name, 14, Colors.black , FontWeight.w500),
          const SizedBox(width: 20),
          myText(surname, 14, Colors.black, FontWeight.w500),
          const SizedBox(width: 10),
          myText(subject, 10, Colors.black, FontWeight.w400),
          widget
        ],
      ),
    ),

  );
}
