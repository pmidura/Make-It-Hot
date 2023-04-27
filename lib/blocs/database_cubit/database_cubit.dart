import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

part 'database_state.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(DatabaseInitial());

  Database? database;
  static const String _dbName = "JSONData.db";
  static const int _version = 1;

  Future<void> initDB() async {
    Directory docsDirectory = await getApplicationDocumentsDirectory();
    final path = join(docsDirectory.path, _dbName);

    var exists = databaseExists(join(docsDirectory.path, _dbName));

    if (await exists == false) {
      print("Creating DB...");

      database = await openDatabase(
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

      emit(DatabaseLoad());
    } else {
      print("Opening existing DB: $_dbName");
      
      database = await openDatabase(path, version: _version);
      emit(DatabaseLoad());
    }
  }
}
