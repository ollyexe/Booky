import 'package:flutter/material.dart';

import 'ChangePasswordPage.dart';

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
    return Scaffold(
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
                margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) {return const ChangePasswordPage();},
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
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: FloatingActionButton.extended(
              backgroundColor: Colors.deepPurple[500],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              onPressed: () {},
              label: const Text
                ( "SIGN OUT",
                  style: TextStyle(fontSize: 16, letterSpacing: 2.2, color: Colors.black),
              ),
            ),
          )
        ],
      )
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
        height: 8,
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
  );
}




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
