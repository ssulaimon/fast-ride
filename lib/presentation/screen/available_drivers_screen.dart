import 'package:fastride/constant/colors.dart';
import 'package:flutter/material.dart';

class AvailableDriverScreen extends StatelessWidget {
  const AvailableDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title: const Text(
          "Availbale Drivers",
        ),
      ),
    );
  }
}
