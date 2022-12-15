import 'package:autobee/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';
import '../models/TyrePsi.dart';
import 'components/tyre_psi_card.dart';
import 'components/tyres.dart';

class TyreScreen extends StatefulWidget {
  const TyreScreen({Key? key}) : super(key: key);

  @override
  State<TyreScreen> createState() => _TyreScreenState();
}

class _TyreScreenState extends State<TyreScreen> {
  final HomeController _controller = HomeController();

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
              if (_controller.isShowTyre) ...tyres(constraints),
              if (_controller.isShowTyreStatus)
                GridView.builder(
                  itemCount: 4,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: defaultPadding,
                    crossAxisSpacing: defaultPadding,
                    childAspectRatio:
                        constraints.maxWidth / constraints.maxHeight,
                  ),
                  itemBuilder: (context, index) => TyrePsiCard(
                    isBottomTwoTyre: index > 1,
                    tyrePsi: demoPsiList[index],
                  ),
                )
            ],
          );
        },
      )),
    );
  }
}