import 'package:flutter/material.dart';

import '../../Utilities/Settings.dart';

Widget header(BuildContext context) {
  return Stack(
    children: [
      AppBar(
        backgroundColor: const Color(0xFF3B5998),
        elevation: 0,
        title: const Text('IUM Project'),
        toolbarHeight: 90,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_rounded),
            onPressed: (){
              Navigator.of(context).push
                (MaterialPageRoute(builder: (BuildContext context) => const Settings()));
            },
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(50, 90, 0, 0),
        child: Container(
          decoration: BoxDecoration(
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
          height: 50,
          width: 300,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.search_rounded,
                  color: Color(0xFF3B5998),
                ),
                onPressed: () {

                },
              ),
              const Text(
                'Cerca qualcosa...',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}

