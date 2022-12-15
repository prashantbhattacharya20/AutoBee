import 'package:autobee/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';

class TempScreen extends StatefulWidget {
  const TempScreen({Key? key}) : super(key: key);

  @override
  State<TempScreen> createState() => _TempScreenState();
}

class _TempScreenState extends State<TempScreen> {
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
            alignment: Alignment.center,
            children: [
              Positioned(
                left: constraints.maxWidth / 2,
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: constraints.maxHeight * 0.1),
                  child: SvgPicture.asset(
                    "assets/icons/Car.svg",
                    width: double.infinity,
                  ),
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
                                    width: defaultPadding,
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
                            Spacer(),
                            Column(
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_drop_up,
                                    size: 48,
                                  ),
                                ),
                                Text(
                                  "29" + "\u2103",
                                  style: TextStyle(fontSize: 86),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 48,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text("CURRENT TEMPERATURE"),
                            const SizedBox(
                              height: defaultPadding,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Inside".toUpperCase()),
                                    Text(
                                      "20" + "\u2103",
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: defaultPadding,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Outside".toUpperCase(),
                                      style: TextStyle(color: Colors.white54),
                                    ),
                                    Text(
                                      "35" + "\u2103",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(color: Colors.white54),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ))),
              Positioned(
                  left: 220,
                  child: AnimatedSwitcher(
                    duration: defaultDuration,
                    child: _controller.isCoolSelected
                        ? Image.asset(
                            "assets/images/Cool_glow_2.png",
                            key: UniqueKey(),
                            width: 200,
                          )
                        : Image.asset(
                            "assets/images/Hot_glow_4.png",
                            key: UniqueKey(),
                            width: 200,
                          ),
                  )),
            ],
          );
        },
      )),
    );
  }
}