import 'package:flutter/material.dart';

import '../../styles/theme.dart' as style;

class EmptyPositions extends StatelessWidget {
  const EmptyPositions({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: style.gradientContainer(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/biting_lips_logo.png",
            width: 200.0,
            height: 200.0,
          ),
          Text(
            "Brak pozycji w wybranej kategorii!",
            textAlign: TextAlign.center,
            style: style.purpleBold16(),
          ),
        ],
      ),
    ),
  );
}
