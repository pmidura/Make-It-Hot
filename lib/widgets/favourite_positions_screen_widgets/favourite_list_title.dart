import 'package:flutter/material.dart';

import '../../styles/theme.dart' as style;

Padding favouriteListTitle() => Padding(
  padding: const EdgeInsets.fromLTRB(25.0, 65.0, 0.0, 15.0),
  child: Text(
    "List of favourite positions",
    style: style.blackBold16(),
  ),
);
