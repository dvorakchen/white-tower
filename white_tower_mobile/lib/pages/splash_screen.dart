import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:white_tower_mobile/pages/subject_list_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(child: Lottie.asset('assets/animations/loading.json')),
      nextScreen: SubjectListScreen(),
      duration: 1_500,
      splashIconSize: 200,
      backgroundColor: Theme.of(context).colorScheme.surface,
      pageTransitionType: .fade,
      splashTransition: .fadeTransition,
    );
  }
}
