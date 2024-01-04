import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String image;
  final void Function() onClick;
  const ImageButton({
    super.key,
    required this.image,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Image.asset(image),
    );
  }
}
