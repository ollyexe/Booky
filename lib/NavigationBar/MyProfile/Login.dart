import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_session_manager/flutter_session_manager.dart' ;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progettoium/Model/LoginM.dart';
import '../../Utilities/CommonWidgets/CommonStyles.dart';
import '../../main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<Login> {
  int log=-1;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var sessionManager = SessionManager();

   Future<int> login(String email , String password) async {

    try{

      Response response = await get(
          Uri.parse('http://192.168.1.15:9999/servlet_war_exploded/apiUtente?path=login&mail=$email&pass=$password'),
      );

      if(response.statusCode == 200){
          print("object received");

         var loginStatus=LoginM.fromJson(jsonDecode(response.body));

         if(loginStatus.loginState=="true"){
           print(loginStatus.stateDescription);
           setState(() {
             log=0;
           });


         }
         else if (loginStatus.loginState=="other"){
           print(loginStatus.stateDescription);
           setState(() {
             log=1;
           });
         }
         else if(loginStatus.loginState=="false"){
           print(loginStatus.stateDescription);
           setState(() {
             log=2;
           });
         }
         else{
           setState(() {
             log=-1;
           });
         }


      }else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
return 0;
  }



  String s="Status";
  TextStyle t = TextStyle(
      color: Colors.white,
      fontSize: 15
  );

  bool statusDisplay(int i){
    if(i==0){
      setState(() {
        s="Succesful Login";
        t = TextStyle(
            color: Colors.green,
            fontSize: 15
        );
      });
      return true;
    }
    else if(i==1){
      setState(() {
        s="User Not Exist";
        t = TextStyle(
            color: Colors.red,
            fontSize: 15
        );
      });
    }
    else if(i==2){
      setState(() {
        s="Wrong Password";
        t = TextStyle(
            color: Colors.red,
            fontSize: 15
        );
      });
    }
    else{
      setState(() {
        s="Login Failed";
        t = TextStyle(
            color: Colors.blue,
            fontSize: 15
        );
      });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: customAppBar(placeholder, myText("Login",22, Theme.of(context).colorScheme.onPrimary, FontWeight.w600), 75,context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',

              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),

            ),
            const SizedBox(height: 20,),
            Text(s,
            style: t,),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: () async {
                await login(emailController.text.toString(), passwordController.text.toString());
                print(statusDisplay(log));
                if(statusDisplay(log)){
                  await sessionManager.set("loginState","true");
                  await sessionManager.set("email",emailController.text.toString());
                  dynamic id = await SessionManager().get("email");
                  print(id);
                  //getUtente api e set session par
                  sleep(const Duration(milliseconds: 50));
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const Root()));
                }
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text('Login'),),
              ),
            ),
            const SizedBox(height: 5,),
            GestureDetector(
              onTap: ()  {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const Root()));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text('Guest'),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}