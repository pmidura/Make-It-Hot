import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/position.dart';
import 'db_provider.dart';

class PositionsProvider {
  Future getPosition(String jsonFilename) async {
    try {
      final response = await rootBundle.loadString(jsonFilename);
      final data = await json.decode(response)['positions'] as List;

      return data.map((e) => DBProvider.db.addPosition(Position.fromJson(e))).toList();
    } catch (error, stackTrace) {
      throw Exception("Exception ocurred: $error stackTrace: $stackTrace");
    }
  }
}
