import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../../main.dart';
import 'ChangeDataPage.dart';
import 'ChangePasswordPage.dart';
import 'Login.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final double coverHeight = 280;
  final double profileHeight = 144;





  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SessionManager().get("loginState"),
      builder: (context, snapshot){
        return ( snapshot.hasData ?  profile() : Login());
      },
    );
  }

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildContent() => Column(
    children: const [
      SizedBox(
        height: 15,
      ),
      Text(
        'Nome Cognome',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      Text(
        'Studente',
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
      SizedBox(height: 20)
    ],
  );

  Widget buildCoverImage() => Container(
    color: Colors.grey,
    child: Image.network(
      'https://img.wallpapic.it/i1862-037-811/medium/spazio-viola-blu-astronomia-sfondo.jpg',
      width: double.infinity,
      height: coverHeight,
      fit: BoxFit.cover,
    ),
  );

  Widget buildProfileImage() => CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: Colors.grey.shade800,
    backgroundImage: const NetworkImage(
        'https://www.punto-informatico.it/app/uploads/2021/06/sfondo_art.jpg'),
    child: Stack(
      children: [
        Positioned(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.fromLTRB(85, 105, 0, 0),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 4, color: Colors.white),
                    color: Colors.blue),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ))
      ],
    ),
  );
  Widget profile(){return Scaffold(
    body: Column(
      children: [
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            buildTop(),
            buildContent(),
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 16.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
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
                            return const ChangePasswordPage();
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
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                    title: const Text("Change Data"),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      //open change Theme
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ChangeDataPage();
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
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.deepPurple[500],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            onPressed: () async {
              await SessionManager().destroy();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const Root()));

            },
            label: const Text(
              "SIGN OUT",
              style: TextStyle(
                  fontSize: 16, letterSpacing: 2.2, color: Colors.black),
            ),
          ),
        ),
      ],
    ),
  );}
}

/*Widget buildTextField(String labelText, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }*/

/*
Center(
              child: ElevatedButton(
                //padding: EdgeInsets.symmetric(horizontal: 40),
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
                child: const Text("SIGN OUT",
                  style: TextStyle(
                      fontSize: 16, letterSpacing: 2.2, color: Colors.black
                  ),),
              ),
            ),
 */





/*
Center(
              child: ElevatedButton(
                //padding: EdgeInsets.symmetric(horizontal: 40),
                //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
                child: const Text("SIGN OUT",
                  style: TextStyle(
                      fontSize: 16, letterSpacing: 2.2, color: Colors.black
                  ),),
              ),
            ),
 */
