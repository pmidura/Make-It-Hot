import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

import '../../blocs/database_cubit/database_cubit.dart';
import '../../repos/position_repo.dart';

StreamBuilder2<int?, int?> streamCounter(BuildContext context, String tableName) => StreamBuilder2<int?, int?>(
  streams: StreamTuple2(
    PositionRepo().getNumberOfRevealedPositionsFromTable(
      database: context.read<DatabaseCubit>().database!,
      tableName: tableName,
    ).asStream(),
    PositionRepo().getNumberOfPositionsFromTable(
      database: context.read<DatabaseCubit>().database!,
      tableName: tableName,
    ).asStream(),
  ),
  builder: (context, snapshots) {
    if (snapshots.snapshot1.data == null || snapshots.snapshot2.data == null) {
      return RichText(
        text: const TextSpan(
          text: "",
        ),
      );
    }
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "${snapshots.snapshot1.data} / ",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          TextSpan(
            text: snapshots.snapshot2.data.toString(),
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
);
