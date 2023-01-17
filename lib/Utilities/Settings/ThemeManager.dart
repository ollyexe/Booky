import 'package:flutter/material.dart';

import 'StorageManager.dart';

class ThemeNotifier with ChangeNotifier {
  final lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: const Color(0xFF355CA8),
    onPrimary: const Color(0xFFFFFFFF),
    primaryContainer: const Color(0xFFD9E2FF),
    onPrimaryContainer: const Color(0xFF001944),
    secondary: const Color(0xFF575E71),
    onSecondary: const Color(0xFFFFFFFF),
    secondaryContainer: Colors.lightBlueAccent, //Color(0xFFDBE2F9),
    onSecondaryContainer: const Color(0xFF141B2C),
    tertiary: const Color(0xFF725572),
    onTertiary: const Color(0xFFFFFFFF),
    tertiaryContainer: const Color(0xFFFDD7FB),
    onTertiaryContainer: const Color(0xFF2A132C),
    error: const Color(0xFFBA1A1A),
    errorContainer: const Color(0xFFFFDAD6),
    onError: const Color(0xFFFFFFFF),
    onErrorContainer: const Color(0xFF410002),
    background: const Color(0xFFFEFBFF),
    onBackground: const Color(0xFF1B1B1F),
    surface: const Color(0xFFFEFBFF),
    onSurface: const Color(0xFF1B1B1F),
    surfaceVariant: const Color(0xFFE1E2EC),
    onSurfaceVariant: const Color(0xFF44464F),
    outline: const Color(0xFF757780),
    onInverseSurface: const Color(0xFFF2F0F4),
    inverseSurface: const Color(0xFF303034),
    inversePrimary: Colors.lightBlue,
    shadow: Colors.grey.withOpacity(0.5), //Color(0xFF000000),
    surfaceTint: const Color(0xFF355CA8),
  );

  final darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: const Color(0xFFAFC6FF),
    onPrimary: const Color(0xFF002D6D),
    primaryContainer: const Color(0xFF17448F),
    onPrimaryContainer: const Color(0xFFD9E2FF),
    secondary: const Color(0xFFBFC6DC),
    onSecondary: const Color(0xFF293042),
    secondaryContainer: const Color(0xFF404659),
    onSecondaryContainer: const Color(0xFFDBE2F9),
    tertiary: const Color(0xFFDFBBDE),
    onTertiary: const Color(0xFF412742),
    tertiaryContainer: const Color(0xFF593E5A),
    onTertiaryContainer: const Color(0xFFFDD7FB),
    error: const Color(0xFFFFB4AB),
    errorContainer: const Color(0xFF93000A),
    onError: const Color(0xFF690005),
    onErrorContainer: const Color(0xFFFFDAD6),
    background: const Color(0xFF1B1B1F),
    onBackground: const Color(0xFFE3E2E6),
    surface: const Color(0xFF1B1B1F),
    onSurface: const Color(0xFFE3E2E6),
    surfaceVariant: const Color(0xFF44464F),
    onSurfaceVariant: const Color(0xFFC5C6D0),
    outline: const Color(0xFF8F9099),
    onInverseSurface: const Color(0xFF1B1B1F),
    inverseSurface: const Color(0xFFE3E2E6),
    inversePrimary: const Color(0xFF355CA8),
    shadow: Colors.black.withOpacity(0.5),
    surfaceTint: const Color(0xFFAFC6FF),
  );

  ColorScheme? _themeData;
  //bool? _isLight;
  ColorScheme? getTheme() => _themeData;
  //bool? getValue() => _isLight;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightColorScheme;
      } else {
        //print('setting dark theme');
        _themeData = darkColorScheme;
      }
      notifyListeners();
    });
    /*
    StorageManager.readSwitch('ThemeMode').then((value){
      var themeMode = value ?? 'light';
      if(themeMode == 'light'){
        _isLight = true;
      }else{
        _isLight = false;
      }
      notifyListeners();
    });
     */
  }

  void setDarkMode() async {
    _themeData = darkColorScheme;
    //_isLight = false;
    StorageManager.saveData('themeMode', 'dark');
    //StorageManager.saveSwitch('themeMode', _isLight!);
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightColorScheme;
    //_isLight = true;
    StorageManager.saveData('themeMode', 'light');
    //StorageManager.saveSwitch('themeMode', _isLight!);
    notifyListeners();
  }
}
