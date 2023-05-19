import 'package:flutter/material.dart';

import '../../styles/theme.dart' as style;

Padding revealedListTitle() => Padding(
  padding: const EdgeInsets.fromLTRB(25.0, 15.0, 0.0, 15.0),
  child: Text(
    "List of discovered positions",
    style: style.blackBold16(),
  ),
);
