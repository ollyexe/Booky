import 'package:flutter/material.dart';


Container buildButton(Color color, IconData icon, String label){
  return Container(// by Professor
    decoration:  BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(2,3),
        )
      ]
    ),
    height: 80,
    width: 150,
    child: Column(
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: color
          ),
          onPressed: () {
              /*
                    Navigator.of(context).push
                      (MaterialPageRoute(builder: (BuildContext context) => const ByProfessor()));
                     */
          },
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    )
  );
}


Widget profSubjectButton = Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    buildButton(Colors.orange,Icons.school_rounded,'Professori'),
    buildButton(Colors.green,Icons.science_rounded , 'Materie')
  ]
);
