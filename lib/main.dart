/* External Libraries imports  */
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

/* Utilities imports */
import 'package:progettoium/Utilities/SingleLecture.dart';

/* Navigation Bar imports */
import 'NavigationBar/Calendar.dart';
import 'NavigationBar/Cart.dart';
import 'NavigationBar/Homepage/HomePage.dart';
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
  final autoSizeGroup = AutoSizeGroup();
  var index=0;

  List<Widget> screens = [
    const HomePage(),
    const Calendar(),
    const Orders(),
    const MyProfile(),
  ];

  List<IconData> iconList = [
    Icons.home_filled,
    Icons.calendar_month_rounded,
    Icons.inventory,
    Icons.person,
  ];

  List<String> elements = [
    "Home",
    "Calendar",
    "Orders",
    "Profile"
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.of(context).push
            (MaterialPageRoute(builder: (BuildContext context) => const Cart()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
      itemCount: iconList.length,
      tabBuilder: (int index, bool isActive) {
        final color = isActive ? const Color(0xFF3B5998) : Colors.grey;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconList[index],
              size: 24,
              color: color,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: AutoSizeText(
                elements[index],
                maxLines: 1,
                style: TextStyle(color: color),
                group: autoSizeGroup,
              ),
            ),
          ],
        );
      },
      backgroundColor: Colors.white,
      elevation: 0,
      activeIndex: index,
      splashColor: Colors.blueAccent,
      splashSpeedInMilliseconds: 250,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      gapLocation: GapLocation.center,
      leftCornerRadius: 10,
      rightCornerRadius: 10,
      onTap: (newIndex) => setState(() => index = newIndex),
      shadow: const BoxShadow(
        offset:  Offset(0, 1),
        blurRadius: 12,
        spreadRadius: 0.5,
        color: Colors.white12,
      ),
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

