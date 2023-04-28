import 'package:flutter/material.dart';

import '../../styles/theme.dart' as style;
import '../gradient_progress_widget/gradient_progress.dart';

Widget loadingWidget() => Scaffold(
  body: Container(
    width: double.infinity,
    height: double.infinity,
    decoration: style.gradientContainer(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          "assets/biting_lips.png",
          width: 200.0,
          height: 200.0,
        ),
        const GradientProgress(),
      ],
    ),
  ),
);

