import 'package:sqflite/sqflite.dart';

import '../models/position.dart';

class PositionRepo {
  Future<dynamic> addPosition({
    required Database database,
    required Position position,
    required String tableName,
  }) async {
    return await database.insert(
      tableName,
      position.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<dynamic> updatePosition({
    required Database database,
    required String title,
    required String isRevealed,
    required String tableName,
  }) async {
    print("Updating position in: $tableName");

    return await database.rawUpdate(
      "UPDATE '$tableName' SET isRevealed = '$isRevealed' WHERE title = '$title'",
    );
  }

  Future<List<Position>> getAllPositions({
    required Database database,
    required String tableName,
  }) async {
    final res = await database.rawQuery("SELECT * FROM '$tableName'");
    
    List<Position> positions =
      res.isNotEmpty ? res.map((pos) => Position.fromJson(pos)).toList() : [];

    print("Getting all positions from: $tableName");

    return positions;
  }

  Future<int?> getNumberOfPositionsFromTable({
    required Database database,
    required String tableName,
  }) async {
    final res = Sqflite.firstIntValue(await database.rawQuery("SELECT COUNT(*) FROM '$tableName'"));    
    return res;
  }

  Future<int?> getNumberOfRevealedPositionsFromTable({
    required Database database,
    required String tableName,
  }) async {
    final res = Sqflite.firstIntValue(await database.rawQuery("SELECT COUNT(*) FROM '$tableName' WHERE isRevealed='true'"));
    return res;
  }

  Future<int?> getCountPositionsFromAllTables({
    required Database database,
  }) async {
    final motRes = Sqflite.firstIntValue(await database.rawQuery("SELECT COUNT(*) FROM ManOnTop"));
    final wotRes = Sqflite.firstIntValue(await database.rawQuery("SELECT COUNT(*) FROM WomanOnTop"));

    final res = motRes! + wotRes!;

    return res;
  }
}
