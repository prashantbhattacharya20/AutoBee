import 'package:autobee/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({Key? key}) : super(key: key);

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.1),
                child: SvgPicture.asset(
                  "assets/icons/Car.svg",
                  width: double.infinity,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: defaultDuration,
              top: 375,
              right: constraints.maxWidth * 0.05,
              child: AnimatedOpacity(
                  duration: defaultDuration,
                  opacity: 1,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.updateFirstRightDoorLock();
                      });
                    },
                    child: AnimatedSwitcher(
                        duration: defaultDuration,
                        switchInCurve: Curves.easeInOutBack,
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(
                              scale: animation,
                              child: child,
                            ),
                        child: _controller.isFirstRightDoorLock
                            ? SvgPicture.asset(
                                "assets/icons/door_lock.svg",
                                key: ValueKey("lock"),
                              )
                            : SvgPicture.asset(
                                "assets/icons/door_unlock.svg",
                                key: ValueKey("unlock"),
                              )),
                  )),
            ),
            AnimatedPositioned(
              duration: defaultDuration,
              top: 375,
              left: constraints.maxWidth * 0.05,
              child: AnimatedOpacity(
                duration: defaultDuration,
                opacity: 1,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.updateFirstLeftDoorLock();
                      });
                    },
                    child: AnimatedSwitcher(
                        duration: defaultDuration,
                        switchInCurve: Curves.easeInOutBack,
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(
                              scale: animation,
                              child: child,
                            ),
                        child: _controller.isFirstLeftDoorLock
                            ? SvgPicture.asset(
                                "assets/icons/door_lock.svg",
                                key: ValueKey("lock"),
                              )
                            : SvgPicture.asset(
                                "assets/icons/door_unlock.svg",
                                key: ValueKey("unlock"),
                              )),
                  )
              ),
            ),
            AnimatedPositioned(
              duration: defaultDuration,
              top: 500,
              right: constraints.maxWidth * 0.05,
              child: AnimatedOpacity(
                duration: defaultDuration,
                opacity: 1,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.updateSecondRightDoorLock();
                      });
                    },
                    child: AnimatedSwitcher(
                        duration: defaultDuration,
                        switchInCurve: Curves.easeInOutBack,
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(
                              scale: animation,
                              child: child,
                            ),
                        child: _controller.isSecondRightDoorLock
                            ? SvgPicture.asset(
                                "assets/icons/door_lock.svg",
                                key: ValueKey("lock"),
                              )
                            : SvgPicture.asset(
                                "assets/icons/door_unlock.svg",
                                key: ValueKey("unlock"),
                              )),
                  )
              ),
            ),
            AnimatedPositioned(
              duration: defaultDuration,
              top: 500,
              left: constraints.maxWidth * 0.05,
              child: AnimatedOpacity(
                duration: defaultDuration,
                opacity: 1,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.updateSecondLeftDoorLock();
                      });
                    },
                    child: AnimatedSwitcher(
                        duration: defaultDuration,
                        switchInCurve: Curves.easeInOutBack,
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(
                              scale: animation,
                              child: child,
                            ),
                        child: _controller.isSecondLeftDoorLock
                            ? SvgPicture.asset(
                                "assets/icons/door_lock.svg",
                                key: ValueKey("lock"),
                              )
                            : SvgPicture.asset(
                                "assets/icons/door_unlock.svg",
                                key: ValueKey("unlock"),
                              )),
                  )
              ),
            ),
            AnimatedPositioned(
              duration: defaultDuration,
              top: 140,
              child: AnimatedOpacity(
                duration: defaultDuration,
                opacity: 1,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.updateBonnetLock();
                      });
                    },
                    child: AnimatedSwitcher(
                        duration: defaultDuration,
                        switchInCurve: Curves.easeInOutBack,
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(
                              scale: animation,
                              child: child,
                            ),
                        child: _controller.isBonnetLock
                            ? SvgPicture.asset(
                                "assets/icons/door_lock.svg",
                                key: ValueKey("lock"),
                              )
                            : SvgPicture.asset(
                                "assets/icons/door_unlock.svg",
                                key: ValueKey("unlock"),
                              )),
                  )
              ),
            ),
            AnimatedPositioned(
              duration: defaultDuration,
              bottom: 140,
              child: AnimatedOpacity(
                duration: defaultDuration,
                opacity: 1,
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _controller.updateTrunkLock();
                      });
                    },
                    child: AnimatedSwitcher(
                        duration: defaultDuration,
                        switchInCurve: Curves.easeInOutBack,
                        transitionBuilder: (child, animation) =>
                            ScaleTransition(
                              scale: animation,
                              child: child,
                            ),
                        child: _controller.isTrunkLock
                            ? SvgPicture.asset(
                                "assets/icons/door_lock.svg",
                                key: ValueKey("lock"),
                              )
                            : SvgPicture.asset(
                                "assets/icons/door_unlock.svg",
                                key: ValueKey("unlock"),
                              )),
                  )
              ),
            ),
          ],
        );
      },
    ));
  }
}