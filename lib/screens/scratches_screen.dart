import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/position.dart';
import '../services/db_provider.dart';
import '../services/positions_provider.dart';
import '../widgets/info_widgets/error_widget.dart';
import '../widgets/info_widgets/loading_widget.dart';
import '../widgets/scratches_screen_widgets/empty_positions.dart';
import '../widgets/scratches_screen_widgets/scratch_positions.dart';

class ScratchesScreen extends StatefulWidget {
  const ScratchesScreen({super.key});

  @override
  State<ScratchesScreen> createState() => _ScratchesScreenState();
}

class _ScratchesScreenState extends State<ScratchesScreen> {
  void loadData(String dbName) async {
    Directory docsDirectory = await getApplicationDocumentsDirectory();

    var exists = databaseExists(join(docsDirectory.path, dbName));

    if (await exists == false) {
      await PositionsProvider().getPosition("assets/json_data/man_on_top.json");
    } else {
      print("Positions exists!");
    }
  }

  @override
  void initState() {
    super.initState();
    loadData("ManOnTop.db");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Position>?>(
      future: DBProvider.db.getAllPositions(),
      builder: (context, AsyncSnapshot<List<Position>?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingWidget();
        } else if (snapshot.hasError) {
          return errorWidget(snapshot.error.toString());
        } else if (snapshot.hasData) {
          if (snapshot.data != null) {
            return scratchPositions(snapshot);
          } else {
            return const EmptyPositions();
          }
        }
        return errorWidget(snapshot.error.toString());
      },
    );
  }
}
