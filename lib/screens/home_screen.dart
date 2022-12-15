import 'package:autobee/screens/fuel_screen.dart';
import 'package:autobee/screens/hyper_screen.dart';
import 'package:autobee/screens/lock_screen.dart';
import 'package:autobee/screens/temp_screen.dart';
import 'package:autobee/screens/tyre_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pages = [
    LockScreen(),
    FuelScreen(),
    HyperScreen(),
    TempScreen(),
    TyreScreen()
  ];

  int selectedTab = 0;

  void onTap(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedTab],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.black),
        child: BottomNavigationBar(
          onTap: onTap,
          currentIndex: selectedTab,
          unselectedFontSize: 0,
          selectedFontSize: 0,
          items: List.generate(
              navIconsSrc.length,
              (index) => BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    navIconsSrc[index],
                    height: index == 1 || index == 2 ? 46 : null,
                    color: index == selectedTab
                        ? index == 2
                            ? Color.fromARGB(255, 255, 120, 110)
                            : primaryColor
                        : Colors.white54,
                  ),
                  label: "")),
        ),
      ),
    );
  }
}

List<String> navIconsSrc = [
  "assets/icons/Lock.svg",
  "assets/icons/gas.svg",
  "assets/icons/lightning.svg",
  "assets/icons/Temp.svg",
  "assets/icons/Tyre.svg",
];
