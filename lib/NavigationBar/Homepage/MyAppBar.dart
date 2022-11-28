import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';

import '../../Utilities/Settings/Settings.dart';

Widget searchBar(){
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
    child: TextField(
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: "Search here",
        alignLabelWithHint: true,
        icon: Icon(
            Icons.search_rounded,
            color: Colors.blue
        ),
      ),
      onSubmitted: (String stringa) {},
    ),
  );
}

IconButton settingsButton(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.settings_rounded),
    onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const Settings()));
    },
  );
}


Widget header(BuildContext context) {
  Text text = myText("IUM Project", 20, Colors.white, FontWeight.w500);
  return Stack(
    children: [
      customAppBar(settingsButton(context),text,90), // Custom Widget from CommonStyles.dart file
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(50, 95, 0, 0),
        child: containerWithShadow(Colors.white, 50, 300, searchBar())
      )
    ],
  );
}

