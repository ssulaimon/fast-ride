import 'package:flutter/material.dart';

class RideTypeWidge extends StatelessWidget {
  final String image;
  final String title;
  final Color? borderColor;
  final void Function()? onTap;
  const RideTypeWidge(
      {super.key,
      required this.image,
      required this.title,
      this.borderColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        decoration: BoxDecoration(
            border:
                borderColor != null ? Border.all(color: borderColor!) : null,
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            Expanded(child: Container()),
            Text(title),
          ],
        ),
      ),
    );
  }
}
