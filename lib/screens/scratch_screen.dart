import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

import '../models/position.dart';
import '../providers/db_provider.dart';
import '../styles/theme.dart' as style;
import '../widgets/info_widgets/empty_positions.dart';
import '../widgets/info_widgets/error_widget.dart';
import '../widgets/info_widgets/loading_widget.dart';

class ScratchScreen extends StatefulWidget {
  final Function callback;
  final String categoryName;

  const ScratchScreen({
    super.key,
    required this.callback,
    required this.categoryName,
  });

  @override
  State<ScratchScreen> createState() => _ScratchScreenState();
}

class _ScratchScreenState extends State<ScratchScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: DBProvider.db.getAllPositionsByCategory(
        categoryName: widget.categoryName,
      ).asStream(),
      builder: (BuildContext context, AsyncSnapshot<List<Position>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingWidget();
        } else if (snapshot.hasError) {
          return errorWidget(snapshot.error.toString());
        } else if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return const EmptyPositions();
          }
          List<Position> positions = snapshot.data!;

          // List<GlobalObjectKey<ScratcherState>> scratchKeyList =
          //   List.generate(
          //     positions.length,
          //     (index) => GlobalObjectKey<ScratcherState>(index),
          //   );

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
                    // key: scratchKeyList[index],
                    color: Colors.deepPurple.shade100,
                    brushSize: 30,
                    accuracy: ScratchAccuracy.low,
                    threshold: 70,
                    onThreshold: () async {
                      // scratchKeyList[index].currentState?.reveal();

                      await DBProvider.db.updatePosition(
                        title: positions[index].title,
                        isRevealed: "true",
                      );
                      widget.callback(DBProvider.db.getNumberOfRevealedPositions().asStream());

                      // if (context.mounted) {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (_) => PositionDetailsScreen(
                      //         positionTitle: positions[index].title,
                      //         positionContent: positions[index].content,
                      //         positionImage: positions[index].image,
                      //         positionCategory: positions[index].category,
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
    );
  }
}
