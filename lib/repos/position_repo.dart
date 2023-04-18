import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/position_response.dart';

class PositionRepo {
  Future<PositionResponse> getPosition(String jsonFilename) async {
    try {
      final response = await rootBundle.loadString(jsonFilename);
      final data = await json.decode(response);
      return PositionResponse.fromJson(data);
    } catch (error, stackTrace) {
      debugPrint("Exception ocurred: $error stackTrace: $stackTrace");
      return PositionResponse.withError("$error");
    }
  }
}
