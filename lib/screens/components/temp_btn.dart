import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';

class TempBtn extends StatelessWidget {
  const TempBtn({
    Key? key,
    required this.svgSrc,
    this.isActive = false,
    required this.press,
    required this.title, 
    this.activeColor = primaryColor,
  }) : super(key: key);

  final String svgSrc, title;
  final bool isActive;
  final VoidCallback press;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOutBack,
            height: isActive ? 76 : 50,
            width: isActive ? 76 : 50,
            child: SvgPicture.asset(
              svgSrc,
              color: isActive ? activeColor : Colors.white38,
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            style: TextStyle(
              color: isActive ? activeColor : Colors.white38,
              fontSize: 16,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
            child: Text(
              title.toUpperCase(),
            ),
          )
        ],
      ),
    );
  }
}
