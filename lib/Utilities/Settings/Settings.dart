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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          customAppBar(placeholder, myText("Settings", 22, Theme.of(context).colorScheme.onPrimary, FontWeight.w600), 75,context),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
            child: Column(
              children: [
                SwitchListTile(
                  title: myText(
                      "Notifications", 18, Theme.of(context).colorScheme.onBackground, FontWeight.normal),
                  //tileColor: Colors.white,
                  secondary: Icon(
                      Icons.notifications, color: Theme.of(context).colorScheme.inversePrimary),
                  value: notificationsOnOff,
                  onChanged: (value) {
                    setState(() {
                      notificationsOnOff = value;
                    });
                  },
                ),
                divider(Theme.of(context).colorScheme.onBackground.withOpacity(0.9)),
                ExpandableNotifier(
                  initialExpanded: false,
                  child: ScrollOnExpand(
                    scrollOnCollapse: true,
                    scrollOnExpand: true,
                    child: ExpandablePanel(
                      theme: ExpandableThemeData(
                        iconColor: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      header: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(18, 15, 0, 15),
                        child: Row(
                          children: [
                            Icon(Icons.dark_mode,color: Theme.of(context).colorScheme.inversePrimary),
                            const SizedBox(width: 30),
                            myText("Change theme", 18, Theme.of(context).colorScheme.onBackground, FontWeight.normal),
                          ],
                        ),
                      ),
                      collapsed: placeholder,
                      expanded: Column(
                        children: [
                          SwitchListTile(
                            title: myText("Light Mode", 18, Theme.of(context).colorScheme.onBackground,
                                FontWeight.normal),
                            secondary: Icon(
                                Icons.sunny, color: Theme.of(context).colorScheme.inversePrimary),
                            value: lightSwitch,
                            onChanged: (value) {
                              setState(() {
                                lightSwitch = value;
                                darkSwitch = !value;
                              });
                            },
                          ),
                          divider(Theme.of(context).colorScheme.onBackground.withOpacity(0.7)),
                          SwitchListTile(
                            title: myText("Dark Mode", 18, Theme.of(context).colorScheme.onBackground,
                                FontWeight.normal),
                            secondary: Icon(
                                Icons.dark_mode, color: Theme.of(context).colorScheme.inversePrimary),
                            value: darkSwitch,
                            onChanged: (value) {
                              setState(() {
                                darkSwitch = value;
                                lightSwitch = !value;
                              });
                            },
                          ),
                          divider(Theme.of(context).colorScheme.onBackground.withOpacity(0.7)),
                          SwitchListTile(
                            title: myText("Colorblind Mode", 18, Theme.of(context).colorScheme.onBackground,
                                FontWeight.normal),
                            secondary: Icon(
                                Icons.visibility_outlined, color: Theme.of(context).colorScheme.inversePrimary),
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
                divider(Theme.of(context).colorScheme.onBackground.withOpacity(0.9)),
                ListTile(
                  leading: Icon(Icons.help,color: Theme.of(context).colorScheme.inversePrimary),
                  title: myText("Help", 18, Theme.of(context).colorScheme.onBackground, FontWeight.normal),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}




