import 'package:flutter/material.dart';

import '../models/position.dart';
import '../services/db_provider.dart';
import '../widgets/info_widgets/error_widget.dart';
import '../widgets/info_widgets/loading_widget.dart';
import '../widgets/scratches_screen_widgets/empty_positions.dart';
import '../widgets/scratches_screen_widgets/scratch_positions.dart';

class ScratchesScreen extends StatelessWidget {
  final String tableName;

  const ScratchesScreen({
    super.key,
    required this.tableName,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Position>?>(
      future: DBProvider.db.getAllPositions(tableName),
      builder: (context, AsyncSnapshot<List<Position>?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingWidget();
        } else if (snapshot.hasError) {
          return errorWidget(snapshot.error.toString());
        } else if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return scratchPositions(snapshot, tableName);
          } else {
            return const EmptyPositions();
          }
        }
        return errorWidget(snapshot.error.toString());
      },
    );
  }  
}
