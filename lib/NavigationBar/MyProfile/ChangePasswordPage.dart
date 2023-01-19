import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../../Model/ChangePassM.dart';
import '../../Model/Client_API.dart';
import '../../Model/LoginM.dart';
import '../../Utilities/CommonWidgets/CommonStyles.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool obscuredpassword1 = true;
  bool obscuredpassword2 = true;
  String s = "Status";
  String g = "Status";
  TextStyle t = const TextStyle(color: Colors.white, fontSize: 15);
  TextStyle n = const TextStyle(color: Colors.white, fontSize: 15);

  int log = -1;
  int change=-1;
  TextEditingController oldPass = TextEditingController();
  TextEditingController newPass = TextEditingController();

  Future<int> login(String email, String password) async {
    try {
      var loginStatus = LoginM.fromJson(
          jsonDecode(await Client_API().getLoginStatus(email, password)));

      if (loginStatus.loginState == "true") {
        setState(() {
          log = 0;
        });
      } else if (loginStatus.loginState == "other") {
        setState(() {
          log = 1;
        });
      } else if (loginStatus.loginState == "false") {
        setState(() {
          log = 2;
        });
      } else {
        setState(() {
          log = -1;
        });
      }
    } catch (e) {}
    return 0;
  }
  Future<int> changeP(String email, String password) async {
    try {
      var changeStatus = CPassM.fromJson(
          jsonDecode(await Client_API().changePassword(email, password)));

      if (changeStatus.changeState == "true") {
        setState(() {
          change = 0;
        });
      }
      else if (changeStatus.changeState == "fail") {
        setState(() {
          change = 2;
        });
      } else {
        setState(() {
          change = -1;
        });
      }
    } catch (e) {}
    return 0;
  }

  bool statusDisplay(int i) {
    if (i == 0) {
      setState(() {
        s = "Succesful Login";

      });
      return true;
    } else if (i == 2) {
      setState(() {
        s = "Wrong Password";
        t = const TextStyle(color: Colors.red, fontSize: 15);

      });
    } else {
      setState(() {
        s = "Fail Try";
      });
    }
    return false;
  }
  bool changeStatusDisplay(int i) {
    if (i == 0) {
      setState(() {
        g = "Succesful Change";
        n= const TextStyle(color: Colors.green, fontSize: 15);

      });
      return true;
    } else if (i == 2) {
      setState(() {
        g = "Something went wrong";
        n = const TextStyle(color: Colors.red, fontSize: 15);
      });
    } else {
      setState(() {
        g = "Fail Try";
        n = const TextStyle(color: Colors.blue, fontSize: 15);
      });
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          placeholderBack,
          myText("Change Password", 22, Colors.white, FontWeight.w600),
          75,
          context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                myText("Create New Password", 37, const Color(0xFF3B5998),
                    FontWeight.w600),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Insert Current and New Password',
                  style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ],
            ),

            //vecchia password
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        n = const TextStyle(color: Colors.white, fontSize: 15);
                        t = const TextStyle(color: Colors.white, fontSize: 15);
                      });
                    },
                    controller: oldPass,
                    obscureText: obscuredpassword1,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF3B5998)),
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'Current Password',
                      hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
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
                    style: const TextStyle(
                        color:Colors.black),
                  ),
                ),
                Text(
                  s,
                  style: t,
                ),
                //nuova password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(

                    controller: newPass,
                    obscureText: obscuredpassword2,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF3B5998)),
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'New Password',
                      hintStyle: TextStyle(
                          color:
                          Theme.of(context).colorScheme.onBackground),
                      hoverColor:
                      Theme.of(context).colorScheme.onBackground,
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
                    style: const TextStyle(
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              g,
              style: n,
            ),

            GestureDetector(
              onTap: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                await login(await SessionManager().get("email"), oldPass.text.toString());
                if (statusDisplay(log)) {
                  await changeP(await SessionManager().get("email"),newPass.text.toString() );
                  changeStatusDisplay(change);
                  sleep(const Duration(milliseconds: 200));
                  Navigator.of(context).pop();

                }
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B5998),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
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

              ),
            ),


          ],
        ),
      ),
    );
  }
}
