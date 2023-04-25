import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/position.dart';
import 'db_provider.dart';

class PositionsProvider {
  Future getPosition(String jsonFilename, String tableName) async {
    try {
      final response = await rootBundle.loadString(jsonFilename);
      final data = await json.decode(response)['positions'] as List;

      final List<Position>? checkList = await DBProvider.db.getAllPositions(tableName);
      
      if (checkList!.isEmpty) {
        return data.map((e) => DBProvider.db.addPosition(Position.fromJson(e), tableName)).toList();
      }
    } catch (error, stackTrace) {
      throw Exception("Exception ocurred: $error stackTrace: $stackTrace");
    }
  }
}
