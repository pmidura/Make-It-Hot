import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/database_cubit/database_cubit.dart';
import '../../repos/position_repo.dart';
import 'scratch_positions.dart';

Widget animatedButton({
  required BuildContext context,
  required String categoryName,
  required String jsonFilename,
  required String tableName,
}) {
  Future<int?> firstFuture = PositionRepo().getNumberOfRevealedPositionsFromTable(
    database: context.read<DatabaseCubit>().database!,
    tableName: tableName,
  );

  Future<int?> secondFuture = PositionRepo().getNumberOfPositionsFromTable(
    database: context.read<DatabaseCubit>().database!,
    tableName: tableName,
  );

  return OpenContainer(
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
              child: FutureBuilder(
                future: Future.wait([firstFuture, secondFuture]),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${snapshot.data[0]} / ",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          TextSpan(
                            text: snapshot.data[1].toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return RichText(
                    text: const TextSpan(
                      text: "",
                    ),
                  );
                }
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
