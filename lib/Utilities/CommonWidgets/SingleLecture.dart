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
        color: Colors.white,
        border: Border.all(color: Colors.black12, width: 1),

      ),
      height: 100,
      width: 350,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 17, 0, 0),
            child: Row(
              children: [
                //Photo
                Column(
                  children: [
                    myText("Prof. $name $surname", 17, Colors.black, FontWeight.bold),
                    myText(subject, 13, Colors.grey, FontWeight.w500),
                  ],
                ),
                const SizedBox(width: 70),
                widget
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(7)
                ),
                width: 70,
                height: 30,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(6, 7, 0, 0),
                  child: myText("09:00-10:00", 11, Colors.white, FontWeight.bold),
                )
              )
            ],
          ),
        ],
      ),
    ),

  );
}
