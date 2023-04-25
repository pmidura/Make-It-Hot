import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/position.dart';

class DBProvider {
  static const int _version = 1;
  static const String _dbName = "JSONData.db";
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async => _database ?? await initDB();

  Future initDB() async {
    Directory docsDirectory = await getApplicationDocumentsDirectory();
    final path = join(docsDirectory.path, _dbName);

    var exists = databaseExists(join(docsDirectory.path, _dbName));

    if (await exists == false) {
      print("Creating DB...");

      return await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          db.execute("""
            CREATE TABLE IF NOT EXISTS ManOnTop(
              title TEXT PRIMARY KEY,
              content TEXT NOT NULL,
              image TEXT NOT NULL,
              category TEXT NOT NULL,
              isRevealed TEXT NOT NULL
            )
        """);

          db.execute("""
            CREATE TABLE IF NOT EXISTS WomanOnTop(
              title TEXT PRIMARY KEY,
              content TEXT NOT NULL,
              image TEXT NOT NULL,
              category TEXT NOT NULL,
              isRevealed TEXT NOT NULL
            )
        """);
        },
      );
    } else {
      print("Opening existing DB: $_dbName");
      return await openDatabase(path, version: _version);
    }
  }
  
  Future<int> addPosition(Position position, String tableName) async {
    final db = await database;

    print("Adding position to: $_dbName");

    return await db.insert(
      tableName,
      position.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updatePosition(String title, String isRevealed, String tableName) async {
    final db = await database;

    print("Updating position in: $_dbName");

    return await db.rawUpdate(
      "UPDATE '$tableName' SET isRevealed = '$isRevealed' WHERE title = '$title'",
    );
  }

  Future<int> deletePosition(Position position, String tableName) async {
    final db = await database;

    return await db.delete(
      tableName,
      where: 'title = ?',
      whereArgs: [position.title],
    );
  }

  Future<List<Position>?> getAllPositions(String tableName) async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM '$tableName'");
    
    List<Position> positions =
      res.isNotEmpty ? res.map((pos) => Position.fromJson(pos)).toList() : [];

    print("Printing all positions in: $_dbName");

    return positions;
  }
}
