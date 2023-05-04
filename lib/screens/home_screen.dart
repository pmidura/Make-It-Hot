import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/database_cubit/database_cubit.dart';
import '../repos/position_repo.dart';
import '../styles/theme.dart' as style;
import '../widgets/home_screen_widgets/animated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: style.gradientContainer(),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            FutureBuilder(
              // future: PositionRepo().getNumberOfPositionsFromTable(
              //   database: context.read<DatabaseCubit>().database!,
              //   tableName: "ManOnTop",
              // ),
              future: PositionRepo().getCountPositionsFromAllTables(
                database: context.read<DatabaseCubit>().database!,
              ),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Center(child: Text(snapshot.data.toString()));
                }
                return const Text("");
              }
            ),

            animatedButton(
              context: context,
              categoryName: "Man On Top",
              jsonFilename: "assets/json_data/man_on_top.json",
              tableName: "ManOnTop",
            ),
            const SizedBox(height: 20.0),
            animatedButton(
              context: context,
              categoryName: "Woman On Top",
              jsonFilename: "assets/json_data/woman_on_top.json",
              tableName: "WomanOnTop",
            ),
          ],
        ),
      ),
    ),
  );
}
