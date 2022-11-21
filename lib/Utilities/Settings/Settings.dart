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
      //Se non vogliamo tenere tutto bianco
      body: Column(
        children: [
          customAppBar(placeholder,
              myText("Settings", 22, Colors.white, FontWeight.w600),75),
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
                      /*child: ListTile(
                        onTap: () {
                          //open edit profile
                        },
                        title: const Text(
                          "Settings",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),*/
                    ),
                    //const SizedBox(height: 10.0),
                    const Text(
                      "Notification Settings",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SwitchListTile(
                      activeColor: Colors.blue,
                      //colore switch
                      contentPadding: const EdgeInsets.all(0),
                      value: isSwitch1,
                      title: Text("Received notification"),
                      onChanged: (bool newBool) {
                        setState(
                              () {
                            isSwitch1 = newBool;
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 15.0),
                    const Text(
                      "App settings",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Card(
                      elevation: 4.0,
                      margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        children: <Widget>[
                          /*const Divider(
                            height: 1.0,
                            thickness: 2,
                            indent: Checkbox.width,
                            endIndent: Checkbox.width,
                          ),*/
                          ListTile(
                            leading: const Icon(
                              Icons.dark_mode,
                              color: Colors.blue,
                            ),
                            title: const Text("Change Theme"),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              //open change Theme
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ChangeThemePage();
                                  },
                                ),
                              );
                            },
                          ),
                          const Divider(
                            height: 1.0,
                            thickness: 2,
                            indent: Checkbox.width,
                            endIndent: Checkbox.width,
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.security,
                              color: Colors.blue,
                            ),
                            title: const Text("Privacy & Security"),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              //open change Theme
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PrivacyPage();
                                  },
                                ),
                              );
                            },
                          ),
                          const Divider(
                            height: 1.0,
                            thickness: 2,
                            indent: Checkbox.width,
                            endIndent: Checkbox.width,
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.help,
                              color: Colors.blue,
                            ),
                            title: const Text("Help"),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              //open change Theme
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return HelpPage();
                                  },
                                ),
                              );
                            },
                          ),
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

/*
ListTile(
                            leading: const Icon(
                              Icons.lock_outline,
                              color: Colors.blue,
                            ),
                            title: const Text("Change Password"),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              //open change password
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ChangePasswordPage();
                                  },
                                ),
                              );
                            },
                          ),
 */