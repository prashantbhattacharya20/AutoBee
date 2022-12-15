import 'package:autobee/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';

class HyperScreen extends StatefulWidget {
  const HyperScreen({Key? key}) : super(key: key);

  @override
  State<HyperScreen> createState() => _HyperScreenState();
}

class _HyperScreenState extends State<HyperScreen> {
  final HomeController _controller = HomeController();

  void onTap() {
    setState(() {
      _controller.updateCoolSelectedTab();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: 410,
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: SvgPicture.asset(
                  "assets/icons/Car.svg",
                  width: double.infinity,
                ),
              ),
              Positioned(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: Opacity(
                      opacity: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: defaultPadding * 3,
                            ),
                            SizedBox(
                              height: 120,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: onTap,
                                    child: Column(
                                      children: [
                                        AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeInOutBack,
                                          height: _controller.isCoolSelected
                                              ? 76
                                              : 50,
                                          width: _controller.isCoolSelected
                                              ? 76
                                              : 50,
                                          child: SvgPicture.asset(
                                            "assets/icons/coolShape.svg",
                                            color: _controller.isCoolSelected
                                                ? primaryColor
                                                : Colors.white38,
                                          ),
                                        ),
                                        const SizedBox(
                                            height: defaultPadding / 2),
                                        AnimatedDefaultTextStyle(
                                          duration: Duration(milliseconds: 200),
                                          style: TextStyle(
                                            color: _controller.isCoolSelected
                                                ? primaryColor
                                                : Colors.white38,
                                            fontSize: 16,
                                            fontWeight:
                                                _controller.isCoolSelected
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                          ),
                                          child: Text(
                                            "Cool".toUpperCase(),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  InkWell(
                                    onTap: onTap,
                                    child: Column(
                                      children: [
                                        AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeInOutBack,
                                          height: !_controller.isCoolSelected
                                              ? 76
                                              : 50,
                                          width: !_controller.isCoolSelected
                                              ? 76
                                              : 50,
                                          child: SvgPicture.asset(
                                            "assets/icons/heatShape.svg",
                                            color: !_controller.isCoolSelected
                                                ? Colors.red
                                                : Colors.white38,
                                          ),
                                        ),
                                        const SizedBox(
                                            height: defaultPadding / 2),
                                        AnimatedDefaultTextStyle(
                                          duration: Duration(milliseconds: 200),
                                          style: TextStyle(
                                            color: !_controller.isCoolSelected
                                                ? Colors.red
                                                : Colors.white38,
                                            fontSize: 16,
                                            fontWeight:
                                                !_controller.isCoolSelected
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                          ),
                                          child: Text(
                                            "Heat".toUpperCase(),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))),
            ],
          );
        },
      )),
    );
  }
}