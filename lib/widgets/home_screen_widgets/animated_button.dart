import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../providers/animated_button_stream/stream_counter.dart';
import 'scratch_positions.dart';

Widget animatedButton({
  required BuildContext context,
  required String categoryName,
  required String jsonFilename,
  required String tableName,
}) => OpenContainer(
  closedColor: Colors.transparent,
  closedElevation: 0,
  middleColor: Colors.transparent,
  openColor: Colors.transparent,
  openElevation: 0,
  transitionDuration: const Duration(milliseconds: 500),
  transitionType: ContainerTransitionType.fadeThrough,
  openBuilder: (_, __) => ScratchPositions(
    jsonFilename: jsonFilename,
    tableName: tableName,
  ),
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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          categoryName,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: streamCounter(context, tableName),
          ),
        ),
      ],
    ),
  ),
);
