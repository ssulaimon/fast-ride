import 'package:fastride/constant/colors.dart';
import 'package:flutter/material.dart';

class DriverMoreDetailsWidget extends StatelessWidget {
  final Icon icon;
  final String data;
  final String title;
  const DriverMoreDetailsWidget({
    super.key,
    required this.icon,
    required this.data,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: MyColors.primary,
              borderRadius: BorderRadius.circular(100)),
          child: icon,
        ),
        Text(
          data,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: MyColors.grey,
          ),
        )
      ],
    );
  }
}
