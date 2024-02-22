import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.controller});
  final SplashController controller;
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
          child: Lottie.asset('assets/lottie/sunny.json')),
    );
  }
}
