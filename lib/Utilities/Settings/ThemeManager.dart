import 'package:flutter/material.dart';
import 'StorageManager.dart';

class ThemeNotifier with ChangeNotifier {
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

  ColorScheme? _themeData;
  ColorScheme? getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightColorScheme;
      } else {
        print('setting dark theme');
        _themeData = darkColorScheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkColorScheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightColorScheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}