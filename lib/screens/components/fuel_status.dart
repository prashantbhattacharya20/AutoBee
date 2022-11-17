import 'package:flutter/material.dart';
import '../../constants.dart';

class FuelStatus extends StatelessWidget {
  const FuelStatus({
    Key? key,
    required this.constrains,
  }) : super(key: key);

  final BoxConstraints constrains;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          "Fuel - 3 Liters left",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: constrains.maxHeight * 0.12,
        ),
        Text(
          "Mileage - 12 Km/l",
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.white),
        ),
        Text(
          "Fuel Low",
          style: TextStyle(fontSize: 24, color: Colors.orange),
        ),
        const SizedBox(
          height: defaultPadding,
        )
      ],
    );
  }
}
