import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/position.dart';
import '../../repos/position_repo.dart';

part 'positions_state.dart';

class PositionsCubit extends Cubit<PositionsState> {
  final PositionRepo repo;

  PositionsCubit({required this.repo}) : super(const PositionsState.loading());

  Future<void> readJson(String jsonFilename) async {
    try {
      final response = await repo.getPosition(jsonFilename);
      emit(PositionsState.success(response.positions));
    } on Exception {
      emit(const PositionsState.failure());
    }
  }
}
