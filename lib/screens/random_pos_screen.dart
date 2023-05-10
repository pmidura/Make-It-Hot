import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scratcher/scratcher.dart';

import '../blocs/database_cubit/database_cubit.dart';
import '../models/position.dart';
import '../repos/position_repo.dart';
import '../styles/theme.dart' as style;
import '../widgets/info_widgets/error_widget.dart';
import '../widgets/info_widgets/loading_widget.dart';
import 'home_screen.dart';

class RandomPosScreen extends StatelessWidget {
  const RandomPosScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => StreamBuilder<List<Position>>(
    stream: PositionRepo().getRandomPosition(
      database: context.read<DatabaseCubit>().database!,
    ).asStream(),
    builder: (BuildContext context, AsyncSnapshot<List<Position>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return loadingWidget();
      } else if (snapshot.hasError) {
        return errorWidget(snapshot.error.toString());
      } else if (snapshot.hasData) {
        if (snapshot.data!.isEmpty) {
          return const HomeScreen();
        }
        List<Position> randPosition = snapshot.data!;

        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: style.gradientContainer(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Scratcher(
                color: Colors.deepPurple.shade100,
                brushSize: 30,
                accuracy: ScratchAccuracy.low,
                threshold: 70,
                onThreshold: () async => await PositionRepo().updatePosition(
                  database: context.read<DatabaseCubit>().database!,
                  title: randPosition.first.title,
                  isRevealed: "true",
                  tableName: "ManOnTop",
                ),
                child: SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: Image(
                    image: NetworkImage(randPosition.first.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        );
      }
      return const HomeScreen();
    },
  );
}
