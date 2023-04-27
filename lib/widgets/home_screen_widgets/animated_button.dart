import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/database_cubit/database_cubit.dart';
import '../../blocs/position_bloc/position_bloc.dart';
import '../../repos/position_repo.dart';
import '../info_widgets/loading_widget.dart';
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
  openBuilder: (_, __) => BlocConsumer<DatabaseCubit, DatabaseState>(
    listener: (context, state) {
      if (state is DatabaseLoad) {
        PositionBloc(
          database: context.read<DatabaseCubit>().database!,
          repo: PositionRepo(),
          jsonFilename: jsonFilename,
        );
      }
    },
    builder: (context, state) {
      if (state is DatabaseLoad) {
        return ScratchPositions(
          jsonFilename: jsonFilename,
          tableName: tableName,
        );
      }
      return loadingWidget();
    },
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
