import 'package:flutter/material.dart';

class GradientColors {
  GradientColors();

  static const Color firstGColor = Color(0xFFFF559F);
  static const Color secondGColor = Color(0xFFCF5CCF);
  static const Color thirdGColor = Color(0xFFFF57AC);
  static const Color fourthGColor = Color(0xFFFF6D91);
  static const Color fifthGColor = Color(0xFFFF8D7E);
  static const Color sixthGColor = Color(0xFFB6BAA6);
}

BoxDecoration gradientContainer() => const BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      GradientColors.firstGColor,
      GradientColors.secondGColor,
      GradientColors.thirdGColor,
      GradientColors.fourthGColor,
      GradientColors.fifthGColor,
      GradientColors.sixthGColor,
    ],
    stops: [
      0.2,
      0.4,
      0.5,
      0.55,
      0.8,
      1,
    ],
  ),
);

TextStyle purpleBold18() => const TextStyle(
  color: Color.fromARGB(255, 100, 0, 255),
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
