import 'package:flutter/material.dart';

import '../../styles/theme.dart' as style;

Widget authorInfo() => Padding(
  padding: const EdgeInsets.only(bottom: 15.0),
  child: Align(
    alignment: Alignment.bottomCenter,
    child: Text(
      "2023 \u00a9 Midura Patryk",
      style: style.blackHalfOpacity13w600(),
    ),
  ),
);
