import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'components/fuel_status.dart';

class FuelScreen extends StatefulWidget {
  const FuelScreen({Key? key}) : super(key: key);

  @override
  State<FuelScreen> createState() => _FuelScreenState();
}

class _FuelScreenState extends State<FuelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
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
              Opacity(
                  opacity: 0.65,
                  child: SvgPicture.asset(
                    "assets/icons/fuel_tank.svg",
                  )),
              Positioned(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Opacity(
                  opacity: 1,
                  child: FuelStatus(
                    constraints: constraints,
                  ),
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}
