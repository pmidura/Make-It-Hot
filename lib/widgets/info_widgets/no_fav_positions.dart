import 'package:flutter/material.dart';

import '../../styles/theme.dart' as style;

Padding noFavPositions() => Padding(
  padding: const EdgeInsets.only(top: 20.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "No favourite positions",
        style: style.blackBold16(),
      ),
      const SizedBox(width: 5.0),
      Image.asset(
        "assets/sad_face_icon.png",
        width: 25.0,
        height: 25.0,
      ),
    ],
  ),
);
