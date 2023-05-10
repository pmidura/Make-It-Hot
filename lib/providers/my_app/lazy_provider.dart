import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/database_cubit/database_cubit.dart';
import '../../blocs/position_bloc/position_bloc.dart';
import '../../repos/position_repo.dart';

BlocProvider<PositionBloc> lazyProvider(
  BuildContext context,
  String jsonFilename,
  String tableName,
) => BlocProvider<PositionBloc>(
  lazy: false,
  create: (_) => PositionBloc(
    database: context.read<DatabaseCubit>().database!,
    repo: PositionRepo(),
    jsonFilename: jsonFilename,
  )..add(
    TableNameEvent(
      tableName: tableName,
    ),
  ),
);
