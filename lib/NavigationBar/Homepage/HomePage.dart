import 'package:flutter/material.dart';
import 'package:progettoium/NavigationBar/Homepage/MyAppBar.dart';
import 'package:progettoium/NavigationBar/Homepage/Selection_Professor_Subject.dart';

import '../../Utilities/Settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          header,
          SizedBox(height: 35),
          profSubjectButton

        ],
      )
    );
  }
}
