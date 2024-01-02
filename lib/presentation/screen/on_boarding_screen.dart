import 'package:fastride/domain/splash_screen_model.dart';
import 'package:fastride/presentation/widgets/on_boarding_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> images = [
      'assets/images/image-one.png',
      'assets/images/image-two.png'
    ];
    const List<SplashScreenModel> splashScreenItems = [
      SplashScreenModel(
          title: 'Select Location',
          subTitle: 'Get Easy access to wide range of location with ease'),
      SplashScreenModel(
        title: 'Enjoy your Ride',
        subTitle:
            'Book your cab and enjoy always availabe safe with loved ones',
      )
    ];
    return Scaffold(
      body: OnBoardingWidget(
        splashScreenTitles: splashScreenItems,
        images: images,
        itemLenght: images.length,
      ),
    );
  }
}
