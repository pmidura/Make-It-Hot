import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/position.dart';
import '../../repos/position_repo.dart';

part 'position_event.dart';
part 'position_state.dart';

class PositionBloc extends Bloc<PositionEvent, PositionState> {
  final PositionRepo repo;
  final Database database;
  final String jsonFilename;

  PositionBloc({required this.database, required this.repo, required this.jsonFilename}) : super(LoadingState()) {
    on<TableNameEvent>((event, emit) async {
      emit(LoadingState());

      try {
        final response = await rootBundle.loadString(jsonFilename);
        final data = await json.decode(response)['positions'] as List;

        final positionsData = await repo.getAllPositions(database: database, tableName: event.tableName);

        if (positionsData.isEmpty) {
          data.map((e) => repo.addPosition(
            database: database,
            position: Position.fromJson(e),
            tableName: event.tableName,
          )).toList();
        }

        emit(LoadedState(positions: positionsData));
      } catch (ex) {
        emit(ErrorState(error: ex.toString()));
      }
    });
  }
}
