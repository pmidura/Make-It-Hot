import 'package:animations/animations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../screens/random_position_screen.dart';
import '../../styles/theme.dart' as style;

class RandomPositionButton extends StatefulWidget {
  final Function callback;

  const RandomPositionButton({
    super.key,
    required this.callback,
  });

  @override
  State<RandomPositionButton> createState() => _RandomPositionButtonState();
}

class _RandomPositionButtonState extends State<RandomPositionButton> {
  @override
  Widget build(BuildContext context) => OpenContainer(
    closedColor: Colors.transparent,
    closedElevation: 0,
    middleColor: Colors.transparent,
    openColor: Colors.transparent,
    openElevation: 0,
    transitionDuration: const Duration(milliseconds: 500),
    transitionType: ContainerTransitionType.fadeThrough,
    openBuilder: (_, __) => RandomPositionScreen(callback: widget.callback),
    closedBuilder: (_, __) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            "Can't decide?",
            style: style.blackBold16(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.symmetric(horizontal: 25.0),
            decoration: BoxDecoration(
              gradient: style.purpleLinearGradient(),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Surprise me!",
                  style: style.blackBold16(),
                ),
                const SizedBox(width: 5.0),
                const Icon(EvaIcons.giftOutline),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
