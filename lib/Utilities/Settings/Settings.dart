import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import '../CommonWidgets/CommonStyles.dart';


class Settings extends StatefulWidget {

  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool notificationsOnOff = true;
  bool lightSwitch = true;
  bool darkSwitch = false;
  bool colorblindSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          customAppBar(placeholder,
              myText("Settings", 22, Colors.white, FontWeight.w600), 75),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
            child: Column(
              children: [
                SwitchListTile(
                  title: myText(
                      "Notifications", 18, Colors.black, FontWeight.normal),
                  tileColor: Colors.white,
                  secondary: const Icon(
                      Icons.notifications, color: Colors.blue),
                  value: notificationsOnOff,
                  onChanged: (value) {
                    setState(() {
                      notificationsOnOff = value;
                    });
                  },
                ),
                divider(Colors.black38),
                ExpandableNotifier(
                  initialExpanded: false,
                  child: ScrollOnExpand(
                    scrollOnCollapse: true,
                    scrollOnExpand: true,
                    child: ExpandablePanel(
                      header: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(18, 15, 0, 15),
                        child: Row(
                          children: [
                            const Icon(Icons.dark_mode,color: Colors.blue),
                            const SizedBox(width: 30),
                            myText("Change theme", 18, Colors.black, FontWeight.normal),
                          ],
                        ),
                      ),
                      collapsed: placeholder,
                      expanded: Column(
                        children: [
                          SwitchListTile(
                            title: myText("Light Mode", 18, Colors.black,
                                FontWeight.normal),
                            secondary: const Icon(
                                Icons.sunny, color: Colors.blue),
                            value: lightSwitch,
                            onChanged: (value) {
                              setState(() {
                                lightSwitch = value;
                                darkSwitch = !value;
                              });
                            },
                          ),
                          divider(Colors.black26),
                          SwitchListTile(
                            title: myText("Dark Mode", 18, Colors.black,
                                FontWeight.normal),
                            secondary: const Icon(
                                Icons.dark_mode, color: Colors.blue),
                            value: darkSwitch,
                            onChanged: (value) {
                              setState(() {
                                darkSwitch = value;
                                lightSwitch = !value;
                              });
                            },
                          ),
                          divider(Colors.black26),
                          SwitchListTile(
                            title: myText("Colorblind Mode", 18, Colors.black,
                                FontWeight.normal),
                            secondary: const Icon(
                                Icons.visibility_outlined, color: Colors.blue),
                            value: colorblindSwitch,
                            onChanged: (value) {
                              setState(() {
                                colorblindSwitch = value;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                divider(Colors.black38),
                ListTile(
                  leading: const Icon(Icons.help,color: Colors.blue,),
                  title: myText("Help", 18, Colors.black, FontWeight.normal),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}




