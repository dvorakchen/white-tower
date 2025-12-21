
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ShowLoading extends StatelessWidget {
  const ShowLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .only(bottom: 80),
      child: Center(
        child: SizedBox(
          width: 320,
          height: 320,
          child: Lottie.asset('assets/animations/loading.json'),
        ),
      ),
    );
  }
}
