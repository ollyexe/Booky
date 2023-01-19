import 'package:flutter/material.dart';

import '../../Utilities/CommonWidgets/CommonStyles.dart';

class ChangeDataPage extends StatefulWidget {
  const ChangeDataPage({Key? key}) : super(key: key);

  @override
  State<ChangeDataPage> createState() => _ChangeDataPageState();
}

class _ChangeDataPageState extends State<ChangeDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(
              placeholderBack,
              myText("Change Data", 22, Colors.white, FontWeight.w600),
              75,
              context),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
            child: Column(
              children: [
                Column(
                  children: [
                    buildTextField("Name", "your name"),
                    buildTextField("Surname", "your surname"),
                    buildTextField("Email", "your@email.com"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: customText("CANCEL")),
                    ElevatedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: customText("SAVE")),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            )),
      ),
    );
  }

  Text customText(String label) {
    return Text(
      label,
      style:
          const TextStyle(fontSize: 18, letterSpacing: 2, color: Colors.black),
    );
  }
}
