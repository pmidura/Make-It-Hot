import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/database_cubit/database_cubit.dart';
import 'providers/my_app/child_consumer_position.dart';
import 'providers/my_app/lazy_provider.dart';
import 'widgets/info_widgets/loading_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<DatabaseCubit>(
    create: (_) => DatabaseCubit()..initDB(),
    child: BlocConsumer<DatabaseCubit, DatabaseState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DatabaseLoad) {
          return MultiBlocProvider(
            providers: [
              lazyProvider(context, "assets/json_data/man_on_top.json", "ManOnTop"),
              lazyProvider(context, "assets/json_data/woman_on_top.json", "WomanOnTop"),
            ],
            child: childConsumerPosition(),
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: loadingWidget(),
        );
      },
    ),
  );
}
