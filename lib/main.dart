import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:progettoium/NavigationBar/Calendar.dart';
import 'package:progettoium/NavigationBar/HomePage.dart';
import 'package:progettoium/Utilities/SingleLecture.dart';

import 'NavigationBar/Cart.dart';
import 'NavigationBar/MyProfile.dart';
import 'NavigationBar/Orders.dart';

void main(){
  runApp(const Progetto());
}

class Progetto extends StatelessWidget {
  const Progetto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Progetto',
      initialRoute: 'Root',
      home: Root(),
    );
  }
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  var index=0;
  List<Widget> screens = [
    const HomePage(),
    const Calendar(),
    const Cart(),
    const Orders(),
    const MyProfile(),
  ];
  List<IconData> iconlist = [
    Icons.home_filled,
    Icons.calendar_month_rounded,
    Icons.shopping_cart,
    Icons.inventory,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      screens[index],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconlist,
        activeIndex: index,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 25,
        rightCornerRadius: 25,
        onTap: (var newIndex) => setState(() => index = newIndex),
      ),
    );
  }
}


/*

 BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF3B5998),
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 10,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: 'Orari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Storico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profilo', //QUI COMPARE IL NOME DELLA PERSONA
          )
        ],
        onTap: (var newIndex)  {
          setState(() {
            index = newIndex;
          });
        },
      ),

 */

