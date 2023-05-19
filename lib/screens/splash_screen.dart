import 'dart:async';

import 'package:flutter/material.dart';

import '../styles/theme.dart' as style;
import '../widgets/gradient_progess_widget/gradient_progress.dart';
import '../widgets/home_screen_widgets/app_logo.dart';
import '../widgets/splash_screen_widgets/app_name.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(milliseconds: 2500),
      () => Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (BuildContext context, _, __) => const HomeScreen(),
          transitionsBuilder: (_, Animation<double> animation, __, Widget child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          transitionDuration: const Duration(milliseconds: 2500),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: style.gradientContainer(),
      child: Column(
        children: [
          appLogo(),
          appName(),
          const Expanded(
            child: GradientProgress(),
          ),
        ],
      ),
    ),
  );
}
