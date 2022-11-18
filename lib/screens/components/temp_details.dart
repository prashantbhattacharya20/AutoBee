import 'package:autobee/screens/components/temp_btn.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../home_controller.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({
    Key? key,
    required HomeController controller,
  })  : _controller = controller,
        super(key: key);

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                TempBtn(
                  isActive: _controller.isCoolSelected,
                  svgSrc: "assets/icons/coolShape.svg",
                  title: "Cool",
                  press: _controller.updateCoolSelectedTab,
                ),
                SizedBox(
                  width: defaultPadding,
                ),
                TempBtn(
                  isActive: !_controller.isCoolSelected,
                  svgSrc: "assets/icons/heatShape.svg",
                  title: "Heat",
                  press: _controller.updateCoolSelectedTab,
                  activeColor: Colors.red,
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
                    "20",
                    style: Theme.of(context).textTheme.headline5,
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
    );
  }
}
