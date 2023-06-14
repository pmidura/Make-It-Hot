import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientColors {
  GradientColors();

  static const Color firstGColor = Color(0xFFFF559F);
  static const Color secondGColor = Color(0xFFCF5CCF);
  static const Color thirdGColor = Color(0xFFFF57AC);
  static const Color fourthGColor = Color(0xFFFF6D91);
  static const Color fifthGColor = Color(0xFFFF8D7E);
  static const Color sixthGColor = Color(0xFFB6BAA6);
}

Color starColor = const Color.fromRGBO(255, 215, 174, 1.0);

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

TextStyle purpleBold16() => TextStyle(
  color: const Color.fromARGB(255, 100, 0, 255),
  fontWeight: FontWeight.w500,
  fontSize: 16.0,
  fontFamily: GoogleFonts.courgette().fontFamily,
);

TextStyle blackBold16() => TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w500,
  fontSize: 16.0,
  fontFamily: GoogleFonts.courgette().fontFamily,
);

TextStyle blackBold20() => TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w500,
  fontSize: 20.0,
  fontFamily: GoogleFonts.courgette().fontFamily,
);

TextStyle blackHalfOpacity13w600() => TextStyle(
  fontSize: 13.0,
  fontWeight: FontWeight.w600,
  color: Colors.black.withOpacity(0.5),
  fontFamily: GoogleFonts.courgette().fontFamily,
);

TextStyle blackBold14w400() => TextStyle(
  height: 1.7,
  fontSize: 14.0,
  fontWeight: FontWeight.w400,
  color: Colors.black,
  fontFamily: GoogleFonts.courgette().fontFamily,
);

TextStyle urlStyle() => TextStyle(
  fontSize: 13.0,
  fontWeight: FontWeight.w600,
  color: const Color.fromARGB(255, 100, 0, 255).withOpacity(0.5),
  fontFamily: GoogleFonts.courgette().fontFamily,
);
