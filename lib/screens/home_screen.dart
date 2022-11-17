import 'package:autobee/constants.dart';
import 'package:autobee/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/autobee_bottom_naviagtionbar.dart';
import 'components/door_lock.dart';
import 'package:velocity_x/velocity_x.dart';
import 'components/fuel_status.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final HomeController _controller = HomeController();

  late AnimationController _fuelAnimationController;
  late Animation<double> _animationFuel;
  late Animation<double> _animationFuelStatus;

  void setupFuelAnimation() {
    _fuelAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _animationFuel = CurvedAnimation(
      parent: _fuelAnimationController,
      curve: Interval(0.0, 0.5),
    );

    _animationFuelStatus = CurvedAnimation(
        parent: _fuelAnimationController, 
        curve: Interval(0.6, 1)
    );
  }

  @override
  void initState() {
    setupFuelAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _fuelAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge([_controller, _fuelAnimationController]),
        builder: (context, _) {
          return Scaffold(
            bottomNavigationBar: AutoBeeBottomNavigationBar(
              onTap: (index) {
                if (index == 1)
                  _fuelAnimationController.forward();
                else if (_controller.selectedBottomTab == 1 && index != 1)
                  _fuelAnimationController.reverse(from: 0.7);
                _controller.onBotytomNavigationTabChange(index);
              },
              selectedTab: _controller.selectedBottomTab,
            ),
            body: SafeArea(child: LayoutBuilder(builder: (context, constrains) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  AppBar(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Auto"
                            .text
                            .fontFamily('RaleWay')
                            .xl5
                            .bold
                            .color(Vx.white)
                            .make()
                            .shimmer(
                                primaryColor:
                                    Color.fromARGB(255, 243, 251, 253),
                                secondaryColor:
                                    Color.fromARGB(255, 80, 80, 80)),
                        "Bee"
                            .text
                            .xl5
                            .color(Color.fromARGB(255, 255, 253, 147))
                            .make()
                            .shimmer(
                                primaryColor: Color.fromARGB(255, 238, 255, 86),
                                secondaryColor:
                                    Color.fromARGB(255, 49, 49, 49)),
                        SvgPicture.asset(
                          "assets/icons/bee.svg",
                          color: Color.fromARGB(255, 243, 251, 253),
                          height: 30,
                        )
                      ],
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: constrains.maxHeight * 0.1),
                    child: SvgPicture.asset(
                      "assets/icons/Car.svg",
                      width: double.infinity,
                    ),
                  ),
                  AnimatedPositioned(
                    duration: defaultDuration,
                    top: 375,
                    right: _controller.selectedBottomTab == 0
                        ? constrains.maxWidth * 0.05
                        : constrains.maxWidth / 2,
                    child: AnimatedOpacity(
                      duration: defaultDuration,
                      opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                      child: DoorLock(
                        isLock: _controller.isFirstRightDoorLock,
                        press: _controller.updateFirstRightDoorLock,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: defaultDuration,
                    top: 375,
                    left: _controller.selectedBottomTab == 0
                        ? constrains.maxWidth * 0.05
                        : constrains.maxWidth / 2,
                    child: AnimatedOpacity(
                      duration: defaultDuration,
                      opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                      child: DoorLock(
                        isLock: _controller.isFirstLeftDoorLock,
                        press: _controller.updateFirstLeftDoorLock,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: defaultDuration,
                    top: 500,
                    right: _controller.selectedBottomTab == 0
                        ? constrains.maxWidth * 0.05
                        : constrains.maxWidth / 2,
                    child: AnimatedOpacity(
                      duration: defaultDuration,
                      opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                      child: DoorLock(
                        isLock: _controller.isSecondRightDoorLock,
                        press: _controller.updateSecondRightDoorLock,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: defaultDuration,
                    top: 500,
                    left: _controller.selectedBottomTab == 0
                        ? constrains.maxWidth * 0.05
                        : constrains.maxWidth / 2,
                    child: AnimatedOpacity(
                      duration: defaultDuration,
                      opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                      child: DoorLock(
                        isLock: _controller.isSecondLeftDoorLock,
                        press: _controller.updateSecondLeftDoorLock,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: defaultDuration,
                    top: _controller.selectedBottomTab == 0 ? 140 : 350,
                    child: AnimatedOpacity(
                      duration: defaultDuration,
                      opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                      child: DoorLock(
                        isLock: _controller.isBonnetLock,
                        press: _controller.updateBonnetLock,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: defaultDuration,
                    bottom: _controller.selectedBottomTab == 0 ? 140 : 240,
                    child: AnimatedOpacity(
                      duration: defaultDuration,
                      opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                      child: DoorLock(
                        isLock: _controller.isTrunkLock,
                        press: _controller.updateTrunkLock,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: _animationFuel.value,
                    child: SvgPicture.asset(
                      "assets/icons/fuel_tank.svg",
                      width: constrains.maxWidth * 0.76,
                    ),
                  ),
                  Positioned(
                    top: 50 * (1 - _animationFuelStatus.value),
                    height: constrains.maxHeight,
                    width: constrains.maxWidth,
                    child: Opacity(
                      opacity: _animationFuelStatus.value,
                      child: FuelStatus(
                        constrains: constrains,
                      ),
                    ),
                  )
                ],
              );
            })),
          );
        });
  }
}
