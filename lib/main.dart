/* External Libraries imports  */
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';

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
      //ADD THEME AND DARK THEME VIA M3 BUILDER
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
        backgroundColor: Colors.orange,
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const Cart()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //NavigationBar
      backgroundColor: const Color(0xFFE7E7E7),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
      itemCount: iconList.length,
      tabBuilder: (int index, bool isActive) {
        final color = isActive ? Colors.white : Colors.grey.shade400;
        final double iconSize = isActive ? 22 : 20;
        final double textSize = isActive ? 12 : 10;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconList[index],
              size: iconSize,
              color: color,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: myText(elements[index], textSize, color, FontWeight.w400)
            ),
          ],
        );
      },
      backgroundColor: const Color(0xFF3B5998),
      elevation: 0,
      activeIndex: index,
      splashColor: Colors.blueAccent,
      splashSpeedInMilliseconds: 400,
      notchSmoothness: NotchSmoothness.sharpEdge,
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


