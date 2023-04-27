import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'scratch_positions.dart';

Widget animatedButton(BuildContext context) => OpenContainer(
  closedColor: Colors.transparent,
  closedElevation: 0,
  middleColor: Colors.transparent,
  openColor: Colors.transparent,
  openElevation: 0,
  transitionDuration: const Duration(milliseconds: 500),
  transitionType: ContainerTransitionType.fadeThrough,
  openBuilder: (_, __) => const ScratchPositions(),
  closedBuilder: (_, __) => Container(
    padding: const EdgeInsets.all(20.0),
    margin: const EdgeInsets.symmetric(horizontal: 25.0),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color.fromARGB(255, 120, 50, 220),
          Color.fromARGB(255, 195, 165, 235),
        ],
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: const Center(
      child: Text(
        "Man On Top",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    ),
  ),
);
