import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scratcher/scratcher.dart';

import '../../blocs/database_cubit/database_cubit.dart';
import '../../blocs/position_bloc/position_bloc.dart';
import '../../models/position.dart';
import '../../repos/position_repo.dart';
import '../../styles/theme.dart' as style;
import '../info_widgets/error_widget.dart';
import '../info_widgets/loading_widget.dart';
import 'empty_positions.dart';

class ScratchPositions extends StatelessWidget {
  const ScratchPositions({
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocProvider<PositionBloc>(
    create: (_) => PositionBloc(
      database: context.read<DatabaseCubit>().database!,
      repo: PositionRepo(),
    )..add(
      TableNameEvent(
        tableName: "ManOnTop",
      ),
    ),
    child: BlocConsumer<PositionBloc, PositionState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingState) {
          return loadingWidget();
        } else if (state is ErrorState) {
          return errorWidget(state.error);
        } else if (state is LoadedState) {
          List<Position> positions = state.positions;

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: style.gradientContainer(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: positions.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: positions[index].isRevealed == "false" ? Scratcher(
                    color: Colors.deepPurple.shade100,
                    brushSize: 30,
                    accuracy: ScratchAccuracy.low,
                    threshold: 70,
                    onThreshold: () async {
                      // await DBProvider.db.updatePosition(snapshot.data![index].title, "true", tableName);

                      // if (context.mounted) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (_) => PositionDetailsScreen(
                      //         positionTitle: snapshot.data![index].title,
                      //         positionContent: snapshot.data![index].content,
                      //         positionImage: snapshot.data![index].image,
                      //         positionCategory: snapshot.data![index].category,
                      //       ),
                      //     ),
                      //   );
                      // }
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Image(
                        image: NetworkImage(positions[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ) : Image(
                    image: NetworkImage(positions[index].image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        }
        return const EmptyPositions();
      },
    ),
  );
}
