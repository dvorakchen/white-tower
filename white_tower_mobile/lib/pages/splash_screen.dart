import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:white_tower_mobile/pages/subject_list_screen.dart';
import 'package:white_tower_mobile/themes/app_colors.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appTheme = ref.read(appThemeProvider);

    return AnimatedSplashScreen(
      splash: Center(child: Lottie.asset('assets/animations/loading.json')),
      nextScreen: SubjectListScreen(),
      duration: 1_500,
      splashIconSize: 200,
      backgroundColor: appTheme.base100,
      pageTransitionType: .fade,
      splashTransition: .fadeTransition,
    );
  }
}
