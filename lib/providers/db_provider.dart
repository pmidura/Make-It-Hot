import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/position.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  static const String _dbName = "makeItHot.db";
  static const int _version = 1;

  DBProvider._();

  Future<Database?> get database async {
    // If db exists, return db
    if (_database != null) {
      return _database;
    }

    // If db don't exists, create one
    _database = await initDB();
    
    return _database;
  }

  // Create db and Positions table
  initDB() async {
    Directory docsDirectory = await getApplicationDocumentsDirectory();
    final path = join(docsDirectory.path, _dbName);

    var exists = databaseExists(path);

    if (await exists == false) {
      print("Creating db: $_dbName");

      return await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) async {
          await db.execute("""
            CREATE TABLE IF NOT EXISTS Positions(
              title TEXT PRIMARY KEY,
              content TEXT NOT NULL,
              category TEXT NOT NULL,
              isRevealed TEXT NOT NULL,
              isFavourite TEXT NOT NULL
            )
        """);
        },
      );
    } else {
      print("Opening existing db: $_dbName");

      return await openDatabase(path, version: _version);
    }
  }

  // Insert position to db
  Future<dynamic> addPosition({
    required Position position,
  }) async {
    final db = await database;
    final res = await db!.insert(
      'Positions',
      position.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return res;
  }

  // Update position in db
  Future<dynamic> updatePosition({
    required String title,
    required String isRevealed,
  }) async {
    final db = await database;
    final res = await db!.rawUpdate(
      "UPDATE Positions SET isRevealed = '$isRevealed' WHERE title = '$title'",
    );
    print("Updating position...");
    return res;
  }

  // Get all positions from db
  Future<List<Position>> getAllPositions() async {
    final db = await database;
    final res = await db!.rawQuery("SELECT * FROM Positions");

    List<Position> positions =
      res.isNotEmpty ? res.map((pos) => Position.fromJson(pos)).toList() : [];

    return positions;
  }

  // Get all positions by category name
  Future<List<Position>> getAllPositionsByCategory({
    required String categoryName,
  }) async {
    final db = await database;
    final res = await db!.rawQuery("SELECT * FROM Positions WHERE category='$categoryName'");

    List<Position> positions =
      res.isNotEmpty ? res.map((pos) => Position.fromJson(pos)).toList() : [];

    return positions;
  }

  // Get random position from db
  Future<List<Position>> getRandomPosition() async {
    final db = await database;
    final res = await db!.rawQuery("SELECT * FROM Positions WHERE isRevealed='false' ORDER BY RANDOM() LIMIT 1");
    return res.map((pos) => Position.fromJson(pos)).toList();
  }

  // When all of positions are revealed get random revealed position from db
  Future<List<Position>> getRandomRevealedPosition() async {
    final db = await database;
    final res = await db!.rawQuery("SELECT * FROM Positions WHERE isRevealed='true' ORDER BY RANDOM() LIMIT 1");
    return res.map((pos) => Position.fromJson(pos)).toList();
  }

  // Get list of revealed positions
  Future<List<Position>> getListOfRevealedPositions({
    required String categoryName,
  }) async {
    final db = await database;
    final res = await db!.rawQuery("SELECT * FROM Positions WHERE category='$categoryName' AND isRevealed='true'");

    List<Position> revPositions =
      res.isNotEmpty ? res.map((pos) => Position.fromJson(pos)).toList() : [];
    
    return revPositions;
  }

  // Get list of not revealed positions
  Future<List<Position>> getListOfNotRevealedPositions({
    required String categoryName,
  }) async {
    final db = await database;
    final res = await db!.rawQuery("SELECT * FROM Positions WHERE category='$categoryName' AND isRevealed='false'");

    List<Position> notRevPositions =
      res.isNotEmpty ? res.map((pos) => Position.fromJson(pos)).toList() : [];

    return notRevPositions;
  }

  // Get number of revealed positions from db
  Future<int?> getNumberOfRevealedPositions() async {
    final db = await database;
    final res = Sqflite.firstIntValue(await db!.rawQuery("SELECT COUNT(*) FROM Positions WHERE isRevealed='true'"));
    return res;
  }

  // Get number of all positions from db
  Future<int?> getNumberOfAllPositions() async {
    final db = await database;
    final res = Sqflite.firstIntValue(await db!.rawQuery("SELECT COUNT(*) FROM Positions"));
    return res;
  }

  // Get number of revealed positions in category
  Future<int?> getRevealedInCategory({
    required String categoryName,
  }) async {
    final db = await database;
    final res = Sqflite.firstIntValue(await db!.rawQuery("SELECT COUNT(*) FROM Positions WHERE category='$categoryName' AND isRevealed='true'"));
    return res;
  }

  // Get count all positions in category
  Future<int?> getCountAllInCategory({
    required String categoryName,
  }) async {
    final db = await database;
    final res = Sqflite.firstIntValue(await db!.rawQuery("SELECT COUNT(*) FROM Positions WHERE category='$categoryName'"));
    return res;
  }

  // Get all favourite positions
  Future<List<Position>> getAllFavPositions() async {
    final db = await database;
    final res = await db!.rawQuery("SELECT * FROM Positions WHERE isFavourite='true'");

    List<Position> positions =
      res.isNotEmpty ? res.map((pos) => Position.fromJson(pos)).toList() : [];

    return positions;
  }

  // Get favourite value (true or false) from position in category
  Future<dynamic> getFavValue({
    required String categoryName,
    required String title,
  }) async {
    final db = await database;
    final res = await db!.rawQuery("SELECT isFavourite FROM Positions WHERE category='$categoryName' AND title='$title'");
    return res;
  }

  // Add position to favourite
  Future<dynamic> addToFav({
    required String categoryName,
    required String title,
  }) async {
    final db = await database;
    final res = await db!.rawQuery("UPDATE Positions SET isFavourite='true' WHERE category='$categoryName' AND title='$title'");
    return res;
  }

  // Remove position from favourite
  Future<dynamic> removeFromFav({
    required String categoryName,
    required String title,
  }) async {
    final db = await database;
    final res = await db!.rawQuery("UPDATE Positions SET isFavourite='false' WHERE category='$categoryName' AND title='$title'");
    return res;
  }
}
