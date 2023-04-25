import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:make_it_hot/screens/scratches_screen.dart';

Widget animatedButton(String categoryName) => OpenContainer(
  closedColor: Colors.transparent,
  closedElevation: 0,
  middleColor: Colors.transparent,
  openColor: Colors.transparent,
  openElevation: 0,
  transitionDuration: const Duration(milliseconds: 500),
  transitionType: ContainerTransitionType.fadeThrough,
  openBuilder: (_, __) => const ScratchesScreen(),
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
    child: Center(
      child: Text(
        categoryName,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    ),
  ),
);
