import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/positions/positions_cubit.dart';
import '../widgets/info_widgets/error_widget.dart';
import '../widgets/info_widgets/loading_widget.dart';
import '../widgets/scratches_screen_widgets/empty_positions.dart';
import '../widgets/scratches_screen_widgets/scratch_positions.dart';

class ScratchesScreen extends StatelessWidget {
  const ScratchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PositionsCubit>().state;

    switch (state.status) {
      case ListStatus.loading:
        return loadingWidget();
      case ListStatus.failure:
        return errorWidget(state.status.toString());
      case ListStatus.success:
        if (state.positions.isEmpty) {
          return const EmptyPositions();
        }
        else {
          return ScratchPositions(state: state);
        }
      default:
        return loadingWidget();
    }
  }
}
