import 'package:flutter/material.dart';
import 'package:fastride/constant/colors.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final double? fontSize;
  const CustomButton(
      {super.key, required this.title, this.onTap, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: MyColors.primary,
          borderRadius: BorderRadius.circular(
            5,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: MyColors.white,
            fontSize: fontSize ?? 25,
          ),
        ),
      ),
    );
  }
}
