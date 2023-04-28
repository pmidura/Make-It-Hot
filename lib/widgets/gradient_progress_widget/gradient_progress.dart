import 'package:flutter/material.dart';
import 'package:gradient_progress_indicator/gradient_progress_indicator.dart';

import '../../styles/theme.dart' as style;

class GradientProgress extends StatelessWidget {
  const GradientProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const GradientProgressIndicator(
    radius: 20,
    duration: 1,
    strokeWidth: 5,
    gradientStops: [
      0.2,
      0.8,
    ],
    gradientColors: [
      style.GradientColors.firstGColor,
      style.GradientColors.secondGColor,
    ],
    child: Text(""),
  );
}
