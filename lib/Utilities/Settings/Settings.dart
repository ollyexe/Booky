import 'package:flutter/material.dart';
import 'ChangeThemePage.dart';
import 'package:flutter/material.dart';

import '../CommonWidgets/CommonStyles.dart';
import 'ChangeThemePage.dart';
import 'HelpPage.dart';
import 'PrivacyPage.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitch1 = false;
  bool isSwitch2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          customAppBar(placeholder,myText("Settings", 22, Colors.white, FontWeight.w600),75),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.blue,
                  ),
                  myText("Notification Settings", 20, Colors.blue, FontWeight.bold),
                  SwitchListTile(
                    activeColor: Colors.blue,
                    contentPadding: const EdgeInsets.all(0),
                    value: isSwitch1,
                    title: const Text("Received notification"),
                    onChanged: (bool newBool) {
                      setState(() {
                        isSwitch1 = newBool;
                      },);
                    },
                  ),
                  const SizedBox(height: 15.0),
                  myText("App settings", 20, Colors.blue, FontWeight.bold),
                  const SizedBox(height: 15.0),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        settingsTile(Icons.dark_mode, "Change Theme", context, const ChangeThemePage()),
                        divider,
                        settingsTile(Icons.security, "Privacy & Security", context, const PrivacyPage()),
                        divider,
                        settingsTile(Icons.help, "Help", context, const HelpPage())
                      ],
                    ),
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

ListTile settingsTile(IconData icon,String label,BuildContext context,Widget widget){
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.blue,
    ),
    title: Text(label),
    trailing: const Icon(Icons.keyboard_arrow_right),
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) {return widget;},),);
    },
  );
}