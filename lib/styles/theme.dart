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

LinearGradient purpleLinearGradient() => const LinearGradient(
  colors: [
    Color.fromARGB(255, 195, 165, 235),
    Color.fromARGB(255, 120, 50, 220),
  ],
);

TextStyle purpleBold16() => const TextStyle(
  color: Color.fromARGB(255, 100, 0, 255),
  fontWeight: FontWeight.w500,
  fontSize: 16.0,
);

TextStyle blackBold16() => const TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w500,
  fontSize: 16.0,
);

TextStyle blackHalfOpacity13w600() => TextStyle(
  fontSize: 13.0,
  fontWeight: FontWeight.w600,
  color: Colors.black.withOpacity(0.5),
);

TextStyle blackBold14w400() => const TextStyle(
  height: 1.6,
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  color: Colors.black,
);
