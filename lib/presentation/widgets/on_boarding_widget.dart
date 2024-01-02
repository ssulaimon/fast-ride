import 'package:fastride/domain/splash_screen_model.dart';
import 'package:fastride/presentation/controller/on_boarding_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnBoardingWidget extends StatelessWidget {
  final List<String> images;
  final int itemLenght;
  final List<SplashScreenModel> splashScreenTitles;
  const OnBoardingWidget({
    super.key,
    required this.splashScreenTitles,
    required this.images,
    required this.itemLenght,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OnBoardingScreenController>(context, listen: false)
          .itemLenght = itemLenght - 1;
    });

    return Consumer<OnBoardingScreenController>(
        builder: (context, onboarding, widget) {
      return Column(
        children: [
          Expanded(
            child: GestureDetector(
              onPanUpdate: (details) {
                if (details.delta.dx > 0) {
                  if (onboarding.currentIndex == 0) {
                    return;
                  } else {
                    onboarding.currentIndex = onboarding.currentIndex - 1;
                  }
                }
                if (details.delta.dx < 0) {
                  if (onboarding.currentIndex == onboarding.itemLenght) {
                    return;
                  } else {
                    onboarding.currentIndex = onboarding.currentIndex + 1;
                  }
                }
              },
              child: Image.asset(
                images[onboarding.currentIndex],
              ),
            ),
          ),
          Text(
            splashScreenTitles[onboarding.currentIndex].title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: Text(
              splashScreenTitles[onboarding.currentIndex].subTitle,
              style: const TextStyle(fontSize: 17),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    });
  }
}
