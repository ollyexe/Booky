import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';

import '../../Utilities/Settings.dart';

Row searchBar(){
  return Row(
    children: [
      const SizedBox(width: 10),
      const Icon(
        Icons.search_rounded,
        color: Color(0xFF3B5998),
      ),
      const SizedBox(width: 20),
      myText('Cerca qualcosa...', 10, Colors.black, FontWeight.w600)
    ],
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
  return Stack(
    children: [
      customAppBar(settingsButton(context)), // Custom Widget from CommonStyles.dart file
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(50, 95, 0, 0),
        child: GestureDetector(
          onTap: () {
            /*Ricerca sul DB */
          },
          child:containerWithShadow(Colors.white, 50, 300, searchBar()),
        )
      )
    ],
  );
}

/*

 */