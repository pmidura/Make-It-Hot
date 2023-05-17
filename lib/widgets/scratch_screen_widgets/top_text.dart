import 'package:flutter/material.dart';

import '../../styles/theme.dart' as style;

Padding topText() => Padding(
  padding: const EdgeInsets.only(top: 60.0),
  child: Text(
    "Zdrap, aby odsłonić!",
    style: style.blackBold20(),
  ),
);
