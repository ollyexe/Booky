/* External Libraries imports  */
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:progettoium/NavigationBar/MyProfile/Login.dart';
import 'package:progettoium/NavigationBar/MyProfile/MyProfile.dart';
import 'package:progettoium/Utilities/CommonWidgets/CommonStyles.dart';

/* Navigation Bar imports */
import 'NavigationBar/Calendar.dart';
import 'NavigationBar/Cart.dart';
import 'NavigationBar/Homepage/HomePage.dart';
import 'NavigationBar/Orders.dart';


void main(){
  runApp(const Progetto());
}

class Progetto extends StatelessWidget {
  const Progetto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Progetto',
      initialRoute: 'Root',
      themeMode: ThemeMode.dark,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const Login(),
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
    const Cart(),
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
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(
          side: BorderSide.none
        ),
        foregroundColor: Colors.orange,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const Cart()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //NavigationBar
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
      itemCount: iconList.length,
      tabBuilder: (int index, bool isActive) {
        final color = isActive ? Theme.of(context).colorScheme.onPrimary : Colors.grey;
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
      backgroundColor: Theme.of(context).colorScheme.primary,
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


final lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF355CA8),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFD9E2FF),
  onPrimaryContainer: Color(0xFF001944),
  secondary: Color(0xFF575E71),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Colors.lightBlueAccent,//Color(0xFFDBE2F9),
  onSecondaryContainer: Color(0xFF141B2C),
  tertiary: Color(0xFF725572),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFDD7FB),
  onTertiaryContainer: Color(0xFF2A132C),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFEFBFF),
  onBackground: Color(0xFF1B1B1F),
  surface: Color(0xFFFEFBFF),
  onSurface: Color(0xFF1B1B1F),
  surfaceVariant: Color(0xFFE1E2EC),
  onSurfaceVariant: Color(0xFF44464F),
  outline: Color(0xFF757780),
  onInverseSurface: Color(0xFFF2F0F4),
  inverseSurface: Color(0xFF303034),
  inversePrimary: Colors.lightBlue,
  shadow: Colors.grey.withOpacity(0.5),//Color(0xFF000000),
  surfaceTint: Color(0xFF355CA8),
);

final darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFAFC6FF),
  onPrimary: Color(0xFF002D6D),
  primaryContainer: Color(0xFF17448F),
  onPrimaryContainer: Color(0xFFD9E2FF),
  secondary: Color(0xFFBFC6DC),
  onSecondary: Color(0xFF293042),
  secondaryContainer: Color(0xFF404659),
  onSecondaryContainer: Color(0xFFDBE2F9),
  tertiary: Color(0xFFDFBBDE),
  onTertiary: Color(0xFF412742),
  tertiaryContainer: Color(0xFF593E5A),
  onTertiaryContainer: Color(0xFFFDD7FB),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1B1B1F),
  onBackground: Color(0xFFE3E2E6),
  surface: Color(0xFF1B1B1F),
  onSurface: Color(0xFFE3E2E6),
  surfaceVariant: Color(0xFF44464F),
  onSurfaceVariant: Color(0xFFC5C6D0),
  outline: Color(0xFF8F9099),
  onInverseSurface: Color(0xFF1B1B1F),
  inverseSurface: Color(0xFFE3E2E6),
  inversePrimary: Color(0xFF355CA8),
  shadow: Colors.black.withOpacity(0.5),
  surfaceTint: Color(0xFFAFC6FF),
);