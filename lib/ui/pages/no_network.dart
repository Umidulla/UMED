import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoNetwork extends StatelessWidget {
  const NoNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/animation/Animation - 1715406941876.json'),
      ),
    );
  }
}
