import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants.dart';

class AutoBeeBottomNavigationBar extends StatelessWidget {
  const AutoBeeBottomNavigationBar({
    Key? key,
    required this.selectedTab,
    required this.onTap,
  }) : super(key: key);

  final int selectedTab;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.black),
      child: BottomNavigationBar(
          onTap: onTap,
          currentIndex: selectedTab,
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
                  label: ""))),
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
