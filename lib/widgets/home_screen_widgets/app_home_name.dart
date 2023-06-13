import 'package:flutter/material.dart';

import '../splash_screen_widgets/app_name.dart';

Padding appHomeName() => Padding(
  padding: const EdgeInsets.only(bottom: 15.0),
  child: Align(
    alignment: Alignment.center,
    child: appName(),
  ),
);
