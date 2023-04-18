import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_it_hot/screens/scratches_screen.dart';

import '../../bloc/positions/positions_cubit.dart';
import '../../repos/position_repo.dart';

Widget animatedButton(String categoryName, String jsonFilename) => OpenContainer(
  closedColor: Colors.transparent,
  closedElevation: 0,
  middleColor: Colors.transparent,
  openColor: Colors.transparent,
  openElevation: 0,
  transitionDuration: const Duration(milliseconds: 500),
  transitionType: ContainerTransitionType.fadeThrough,
  openBuilder: (_, __) => BlocProvider(
    create: (_) => PositionsCubit(repo: PositionRepo())..readJson(jsonFilename),
    child: const ScratchesScreen(),
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
