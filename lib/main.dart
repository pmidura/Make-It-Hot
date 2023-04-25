import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'screens/home_screen.dart';
import 'services/positions_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  Directory docsDirectory = await getApplicationDocumentsDirectory();
  var exists = databaseExists(join(docsDirectory.path, "JSONData.db"));

  if (await exists == false) {
    await PositionsProvider().getPosition("assets/json_data/man_on_top.json", "ManOnTop");
    print("DB not exists... adding positions from JSON file");
  } else {
    print("DB exists... positions already exists...");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  );
}
