import 'package:flutter/material.dart';

import 'package:weather_app/modules/home/home_screen.dart';
import 'package:weather_app/modules/onboarding/widget/IntroOnboarding.dart';

import 'widget/Introduction.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final List<Introduction> list = [
    Introduction(
      title: 'Detailed Hourly Forecast',
      subTitle: 'Get in - depth weather information.',
      imageUrl: 'assets/images/11.png',
    ),
    Introduction(
      title: 'Real-Time Weather Map',
      subTitle: 'Watch the progress of the precipitation to stay informed',
      imageUrl: 'assets/images/22.png',
    ),
    Introduction(
      title: 'Weather Around the World',
      subTitle: 'Add any location you want and swipe easily to chnage.',
      imageUrl: 'assets/images/33.png',
    ),
    Introduction(
      title: 'Detailed Hourly Forecast',
      subTitle: 'Get in - depth weather information.',
      imageUrl: 'assets/images/44.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      backgroudColor: const Color(0xff484B5B),
      introductionList: list,
      onTapSkipButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ), //MaterialPageRoute
        );
      },
    );
  }
}
