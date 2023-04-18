import 'package:flutter/material.dart';

import '../../styles/theme.dart' as style;

Widget errorWidget(String error) => Scaffold(
  body: Container(
    width: double.infinity,
    height: double.infinity,
    decoration: style.gradientContainer(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/biting_lips.png",
          width: 200.0,
          height: 200.0,
        ),
        Text(
          "Error occured: $error",
          textAlign: TextAlign.center,
          style: style.purpleBold18(),
        ),
      ],
    ),
  ),
);
