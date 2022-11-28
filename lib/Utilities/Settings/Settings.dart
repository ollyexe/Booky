import 'package:flutter/material.dart';
import 'package:progettoium/Utilities/Settings/SingleSetting.dart';
import '../CommonWidgets/CommonStyles.dart';


class Settings extends StatefulWidget {

  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool switchOnOff = false;

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.notifications,
      Icons.dark_mode,
      Icons.security,
      Icons.help,
    ];
    List<String> labels = [
      "Notifications",
      "Change Theme",
      "Privacy & Security",
      "Help"
    ];
    List<Widget> topWidgets = [
      mySwitch(),
      const Icon(Icons.keyboard_arrow_right,size: 30),
      const Icon(Icons.keyboard_arrow_right,size: 30),
      const Icon(Icons.keyboard_arrow_right,size: 30),
    ];
    List<bool> expand = [
      false,
      true,
      true,
      true
    ];
    List<Widget> bottomWidgets = [
      placeholder,
      changeThemes(),
      placeholder,
      placeholder
    ];
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          customAppBar(placeholder,myText("Settings", 22, Colors.white, FontWeight.w600),75),
          /*
          Container(
            color: Colors.white,
            height: 60,
            width: 357,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.notifications,color: Colors.blue,),
                  myText("Notifications",17,Colors.black,FontWeight.normal),
                  mySwitch()
                ],
              ),
            )
          ),
           */
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => divider,
              padding: const EdgeInsetsDirectional.fromSTEB(13, 20, 13, 0),
              scrollDirection: Axis.vertical,
              itemCount: 4,
              itemBuilder: (context,int index) {
                return SingleSetting(
                  topPartSettings(icons[index], labels[index], topWidgets[index]),
                  expand[index],
                  bottomWidgets[index]
                );
              }
            ),
          )
        ],
      ),
    );
  }

  Switch mySwitch(){
    return Switch(
      value: switchOnOff,
      activeColor: Colors.blue,
      onChanged: (bool value) {
        setState(() {
          if(switchOnOff == false){
           switchOnOff = true;
          }else{
            switchOnOff = false;
          }
        });
      },
    );
  }

  Column changeThemes(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.sunny),
            myText("Light Mode", 18, Colors.black, FontWeight.normal),
            mySwitch()
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.dark_mode),
            myText("Dark Mode", 18, Colors.black, FontWeight.normal),
            mySwitch()
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.visibility_outlined),
            myText("Colorblind Mode", 18, Colors.black, FontWeight.normal),
            mySwitch()
          ],
        )
      ],
    );
  }

  Widget topPartSettings(IconData icon,String label, Widget topWidget){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon,color: Colors.blue),
        myText(label, 18, Colors.black, FontWeight.normal),
        topWidget
      ],
    );
  }

}
