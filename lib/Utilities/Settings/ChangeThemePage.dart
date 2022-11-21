import 'package:flutter/material.dart';
import '../CommonWidgets/CommonStyles.dart';

class ChangeThemePage extends StatefulWidget {
  const ChangeThemePage({Key? key}) : super(key: key);

  @override
  State<ChangeThemePage> createState() => _ChangeThemePageState();
}

class _ChangeThemePageState extends State<ChangeThemePage> {
  bool isSwitch1 = false;
  ThemeData _dark = ThemeData(brightness: Brightness.dark);
  ThemeData _light = ThemeData(brightness: Brightness.light);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isSwitch1 ? _dark : _light,
      home: Scaffold(
        body: Column(
          children: [
            customAppBar(const SizedBox(height: 0, width: 0),
                myText("Change Theme", 22, Colors.white, FontWeight.w600),50),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.dark_mode,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 10),
                              myText("Dark Theme", 18, Colors.black,
                                  FontWeight.bold),
                            ],
                          ),
                          Switch(
                            value: isSwitch1,
                            onChanged: (bool newBool) {
                              setState(
                                    () {
                                  isSwitch1 = newBool;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
