import 'package:flutter/material.dart';

import '../styles/theme.dart' as style;
import '../widgets/home_screen_widgets/animated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: style.gradientContainer(),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            animatedButton("Man On Top"),
          ],
        ),
      ),
    ),
  );
}
