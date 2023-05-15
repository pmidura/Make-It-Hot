import 'package:flutter/material.dart';

import '../../styles/theme.dart' as style;

Widget categoriesListTitle() => Padding(
  padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 10.0),
  child: Text(
    "Kategorie",
    style: style.blackBold16(),
  ),
);
