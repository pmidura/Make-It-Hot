import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/position.dart';

class DBProvider {
  static const int _version = 1;
  static const String _dbName = "ManOnTop.db";
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async => _database ?? await initDB();

  initDB() async {
    Directory docsDirectory = await getApplicationDocumentsDirectory();
    final path = join(docsDirectory.path, _dbName);

    var exists = databaseExists(join(docsDirectory.path, _dbName));

    if (await exists == false) {
      print("Initialize DB...");

      return await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) => db.execute("""
          CREATE TABLE IF NOT EXISTS Positions(
            title TEXT PRIMARY KEY,
            content TEXT NOT NULL,
            image TEXT NOT NULL,
            category TEXT NOT NULL,
            isRevealed TEXT NOT NULL
          )
        """),
      );
    } else {
      print("Opening exists DB...");
      return await openDatabase(path, version: _version);
    }
  }
  
  addPosition(Position position) async {
    print("Adding position");


    final db = await database;

    return await db.insert(
      "Positions",
      position.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updatePosition(String title, String isRevealed) async {
    print("Updating position...");


    final db = await database;

    return await db.rawUpdate(
      "UPDATE Positions SET isRevealed = '$isRevealed' WHERE title = '$title'",
    );
  }

  Future<int> deletePosition(Position position) async {
    final db = await database;

    return await db.delete(
      "Positions",
      where: 'title = ?',
      whereArgs: [position.title],
    );
  }

  Future<List<Position>?> getAllPositions() async {
    print("Printing all Positions...");

    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Positions");
    
    List<Position> positions =
      res.isNotEmpty ? res.map((pos) => Position.fromJson(pos)).toList() : [];

    return positions;
  }
}
