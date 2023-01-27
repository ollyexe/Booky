import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:progettoium/Model/LoginM.dart';

import '../../Model/Client_API.dart';
import '../../Utilities/CommonWidgets/CommonStyles.dart';
import '../../main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<Login> {
  int log = -1;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var sessionManager = SessionManager();

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

  String s = "Status";
  TextStyle t = const TextStyle(color: Colors.white, fontSize: 15);

  bool statusDisplay(int i) {
    if (i == 0) {
      setState(() {
        s = "Succesful Login";
        t = const TextStyle(color: Colors.green, fontSize: 15);
      });
      return true;
    } else if (i == 1) {
      setState(() {
        s = "User Not Exist";
        t = const TextStyle(color: Colors.red, fontSize: 15);
      });
    } else if (i == 2) {
      setState(() {
        s = "Wrong Password";
        t = const TextStyle(color: Colors.red, fontSize: 15);
      });
    } else {
      setState(() {
        s = "Login Failed";
        t = const TextStyle(color: Colors.blue, fontSize: 15);
      });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: customAppBar(
          placeholder,
          myText("Login", 22, Theme.of(context).colorScheme.onPrimary,
              FontWeight.w600),
          75,
          context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              s,
              style: t,
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                await login(emailController.text.toString(),
                    passwordController.text.toString());

                if (statusDisplay(log)) {
                  await sessionManager.set("login_state", "true");
                  await sessionManager.set(
                      "email", emailController.text.toString());
                  await SessionManager().get("email");
                  var u = await Client_API()
                      .getUser(await sessionManager.get("email"))
                      .then((value) => userFromJson(value));
                  await sessionManager.set("nome", u.nome);
                  await sessionManager.set("cognome", u.cognome);
                  await sessionManager.set("ruolo", u.ruolo);
                  await sessionManager.set("pf", u.pf);
                  sleep(const Duration(seconds: 2));
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(duration: Duration(seconds: 3),content: Text('Login effettuato con Successo!')));
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => const Root()));
                }
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text('Login'),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () async {
                await sessionManager.set("login_state", "false");
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => const Root()));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text('Guest'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
