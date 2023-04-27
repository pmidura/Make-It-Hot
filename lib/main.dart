import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_it_hot/widgets/info_widgets/loading_widget.dart';

import 'blocs/database_cubit/database_cubit.dart';
import 'blocs/position_bloc/position_bloc.dart';
import 'repos/position_repo.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  // Directory docsDirectory = await getApplicationDocumentsDirectory();
  // var exists = databaseExists(join(docsDirectory.path, "JSONData.db"));

  // if (await exists == false) {
  //   await PositionsProvider().getPosition("assets/json_data/man_on_top.json", "ManOnTop");
  //   print("DB not exists... adding positions from JSON file");
  // } else {
  //   print("DB exists... positions already exists...");
  // }

  // runApp(
  //   BlocProvider<DatabaseCubit>(
  //     create: (context) => DatabaseCubit()..initDB(),
  //     child: const MyApp(),
  //   ),
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => DatabaseCubit()..initDB(),
    child: BlocConsumer<DatabaseCubit, DatabaseState>(
      listener: (context, state) {
        if (state is DatabaseLoad) {
          PositionBloc(
            database: context.read<DatabaseCubit>().database!,
            repo: PositionRepo(),
          );
        }
      },
      builder: (context, state) {
        if (state is DatabaseLoad) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          );
        }

        // Return DB Not Found !!!
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: loadingWidget(),
        );
      },
    ),
  );
}
