import 'package:flutter/material.dart';

import '../../styles/theme.dart' as style;
import '../gradient_progess_widget/gradient_progress.dart';

Widget loadingWidget() => Scaffold(
  body: Container(
    width: double.infinity,
    height: double.infinity,
    decoration: style.gradientContainer(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        GradientProgress(),
      ],
    ),
  ),
);
