import 'package:flutter/material.dart';

import '../../Utilities/CommonWidgets/CommonStyles.dart';



class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool obscuredpassword1 = true;
  bool obscuredpassword2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(placeholder, myText("Change Password", 22, Colors.white, FontWeight.w600),75,context),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                myText("Create New Password", 37, Color(0xFF3B5998),
                    FontWeight.w600),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Insert Current and New Password',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                const SizedBox(height: 50),
                //vecchia password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: obscuredpassword1,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF3B5998)),
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'Current Password',
                      fillColor: Colors.grey[200],
                      filled: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscuredpassword1 = !obscuredpassword1;
                          });
                        },
                        icon: Icon(
                          obscuredpassword1
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                //nuova password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: obscuredpassword2,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFF3B5998)),
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'New Password',
                      fillColor: Colors.grey[200],
                      filled: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscuredpassword2 = !obscuredpassword2;
                          });
                        },
                        icon: Icon(
                          obscuredpassword2
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 150),

                //bottone
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xFF3B5998),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Change Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}