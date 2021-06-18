import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodybite_app/screens/Fitness-App-HomeScreen.dart';
import 'package:foodybite_app/screens/FitnessAppTheme.dart';
import 'package:foodybite_app/utils/storage.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'screens/landingScreen.dart';
import 'screens/login-screen.dart';
import 'screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PreferenceUtils.init();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Foodybite',
        theme: ThemeData(
          textTheme:
              GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FitnessAppHomeScreen());
  }
}

Widget build(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.grey,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  return MaterialApp(
    title: 'Flutter UI',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      textTheme: FitnessAppTheme.textTheme,
      platform: TargetPlatform.iOS,
    ),
  );
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
