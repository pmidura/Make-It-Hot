import 'package:flutter/material.dart';

import '../../styles/theme.dart' as style;

Padding revealedListTitle() => Padding(
  padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 10.0),
  child: Text(
    "Lista odkrytych pozycji",
    style: style.blackBold16(),
  ),
);
