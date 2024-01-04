import 'package:flutter/material.dart';
import 'package:fastride/constant/colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  final double? padding;
  const CustomButton(
      {super.key, required this.child, this.onTap, this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: padding ?? 5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: MyColors.primary,
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          child: child),
    );
  }
}
