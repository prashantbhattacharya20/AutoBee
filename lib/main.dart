import 'package:autobee/screens/fuel_screen.dart';
import 'package:autobee/screens/home_screen.dart';
import 'package:autobee/screens/hyper_screen.dart';
import 'package:autobee/screens/lock_screen.dart';
import 'package:autobee/screens/temp_screen.dart';
import 'package:autobee/screens/tyre_screen.dart';
import 'package:autobee/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => HomeScreen(),
        "/lock": (context) => LockScreen(),
        "/fuel": (context) => FuelScreen(),
        "/hyper": (context) => HyperScreen(),
        "/temp": (context) => TempScreen(),
        "/tyre": (context) => TyreScreen(),
      },
    );
  }
}
