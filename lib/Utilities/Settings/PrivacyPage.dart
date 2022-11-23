import 'package:flutter/material.dart';

import '../CommonWidgets/CommonStyles.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool isSwitch1 = false;
  bool isSwitch2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(const SizedBox(height: 0, width: 0),
              myText("Privacy & Security", 22, Colors.white, FontWeight.w600),75),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius  : BorderRadius.circular(10.0)),
                    color: Colors.blue),
                  const Text(
                    "Facial Recognition",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SwitchListTile(
                    activeColor: Colors.blue,
                    contentPadding: const EdgeInsets.all(0),
                    value: isSwitch1,
                    title: const Text("prova"),
                    onChanged: (bool newBool) {
                      setState(() {
                          isSwitch1 = newBool;},
                      );
                    },
                  ),
                  const SizedBox(height: 15.0),
                  const Text(
                    "Fingerprint Recognition",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SwitchListTile(
                    activeColor: Colors.blue,
                    contentPadding: const EdgeInsets.all(0),
                    value: isSwitch2,
                    title: Text("prova"),
                    onChanged: (bool newBool) {
                      setState(
                            () {
                          isSwitch2 = newBool;
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
