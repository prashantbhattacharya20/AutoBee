import 'package:autobee/constants.dart';
import 'package:autobee/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/autobee_bottom_naviagtionbar.dart';
import 'components/door_lock.dart';
import 'package:velocity_x/velocity_x.dart';
import 'components/fuel_status.dart';
import 'components/temp_btn.dart';
import 'components/temp_details.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final HomeController _controller = HomeController();

  late AnimationController _fuelAnimationController;
  late Animation<double> _animationFuel;
  late Animation<double> _animationFuelStatus;
  late AnimationController _tempAnimationController;
  late Animation<double> _animationCarShift;
  late Animation<double> _animationTempShowInfo;
  late Animation<double> _animationCoolGlow;

  void setupFuelAnimation() {
    _fuelAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _animationFuel = CurvedAnimation(
      parent: _fuelAnimationController,
      curve: Interval(0.0, 0.5),
    );

    _animationFuelStatus = CurvedAnimation(
        parent: _fuelAnimationController, curve: Interval(0.6, 1));
  }

  void setupTempAnimation() {
    _tempAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    _animationCarShift = CurvedAnimation(
        parent: _tempAnimationController, curve: Interval(0.2, 0.4));

    _animationTempShowInfo = CurvedAnimation(
        parent: _tempAnimationController, curve: Interval(0.45, 0.65));

     _animationCoolGlow = CurvedAnimation(
        parent: _tempAnimationController, curve: Interval(0.7, 1));
  }

  @override
  void initState() {
    setupFuelAnimation();
    setupTempAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _fuelAnimationController.dispose();
    _tempAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge(
            [_controller, _fuelAnimationController, _tempAnimationController]),
        builder: (context, _) {
          return Scaffold(
            bottomNavigationBar: AutoBeeBottomNavigationBar(
              onTap: (index) {
                if (index == 1)
                  _fuelAnimationController.forward();
                else if (_controller.selectedBottomTab == 1 && index != 1)
                  _fuelAnimationController.reverse(from: 0.7);

                if (index == 3)
                  _tempAnimationController.forward();
                else if (_controller.selectedBottomTab == 3 && index != 3)
                  _tempAnimationController.reverse(from: 0.4);
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
                            .make(),
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
                  Positioned(
                    left: constrains.maxWidth / 2 * _animationCarShift.value,
                    height: constrains.maxHeight,
                    width: constrains.maxWidth,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: constrains.maxHeight * 0.1),
                      child: SvgPicture.asset(
                        "assets/icons/Car.svg",
                        width: double.infinity,
                      ),
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
                  ),
                  Positioned(
                      height: constrains.maxHeight,
                      width: constrains.maxWidth,
                      top: 60 * (1 - _animationTempShowInfo.value),
                      child: Opacity(
                          opacity: _animationTempShowInfo.value,
                          child: TempDetails(controller: _controller))),
                  Positioned(
                      right: -180 * (1 - _animationCoolGlow.value),
                      child: AnimatedSwitcher(
                        duration: defaultDuration,
                        child: _controller.isCoolSelected ? Image.asset(
                          "assets/images/Cool_glow_2.png",
                          key: UniqueKey(),
                          width: 200,
                        ) : Image.asset(
                          "assets/images/Hot_glow_4.png",
                          key: UniqueKey(),
                          width: 200,
                        ),
                      )
                  )
                ],
              );
            })),
          );
        });
  }
}
