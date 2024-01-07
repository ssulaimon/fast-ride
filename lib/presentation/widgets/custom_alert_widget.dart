import 'package:fastride/constant/colors.dart';
import 'package:fastride/presentation/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class CustomAlertWidget extends StatelessWidget {
  final String message;
  final String image;
  final void Function() onTap;
  const CustomAlertWidget(
      {super.key,
      required this.image,
      required this.message,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: const BoxDecoration(color: MyColors.white),
          height: 320,
          child: Column(
            children: [
              Image.asset(image),
              const SizedBox(
                height: 20,
              ),
              Text(
                message,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                padding: 10,
                onTap: onTap,
                child: const Text(
                  "Dismiss",
                  style: TextStyle(
                    color: MyColors.white,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
