import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/database_cubit/database_cubit.dart';
import '../../blocs/position_bloc/position_bloc.dart';
import '../../repos/position_repo.dart';

BlocProvider<PositionBloc> lazyManOnTop(BuildContext context) => BlocProvider<PositionBloc>(
  lazy: false,
  create: (_) => PositionBloc(
    database: context.read<DatabaseCubit>().database!,
    repo: PositionRepo(),
    jsonFilename: "assets/json_data/man_on_top.json",
  )..add(
    TableNameEvent(
      tableName: "ManOnTop",
    ),
  ),
);
