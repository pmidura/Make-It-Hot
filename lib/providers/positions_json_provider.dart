import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/position.dart';
import 'db_provider.dart';

class PositionsJSONProvider {
  Future<List<Position>> addJSONDataToDB() async {
    try {
      final response = await rootBundle.loadString("assets/json_data/positions.json");
      final data = await json.decode(response)['positions'] as List;

      List<Position> positionsData = await DBProvider.db.getAllPositions();

      if (positionsData.isEmpty) {
        for (final position in data) {
          print("Adding position to database...");
          await DBProvider.db.addPosition(
            position: Position.fromJson(position),
          );
        }
        positionsData = await DBProvider.db.getAllPositions();
      }
      return positionsData;
    } catch (ex) {
      throw Exception(ex.toString());
    } 
  }
}
