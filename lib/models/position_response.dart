import 'position.dart';

class PositionResponse {
  final List<Position> positions;
  final String error;

  PositionResponse({
    required this.positions,
    required this.error,
  });

  PositionResponse.fromJson(Map<String, dynamic> json) :
    positions = (json["positions"] as List).map((e) => Position.fromJson(e)).toList(),
    error = "";

  PositionResponse.withError(String errorValue) :
    positions = [],
    error = errorValue;
}
