import 'package:flutter/material.dart';
import 'package:gradient_progress_indicator/gradient_progress_indicator.dart';

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
      Color.fromRGBO(220, 28, 19, 1),
      Color.fromRGBO(234, 76, 70, 1),
    ],
    child: Text(""),
  );
}
