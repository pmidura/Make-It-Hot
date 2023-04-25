import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

import '../../models/position.dart';
import '../../screens/position_details_screen.dart';
import '../../services/db_provider.dart';
import '../../styles/theme.dart' as style;

Container scratchPositions(AsyncSnapshot<List<Position>?> snapshot) => Container(
  width: double.infinity,
  height: double.infinity,
  decoration: style.gradientContainer(),
  child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: snapshot.data![index].isRevealed == "false" ? Scratcher(
          color: Colors.deepPurple.shade100,
            brushSize: 30,
            accuracy: ScratchAccuracy.low,
            threshold: 70,
            onThreshold: () async {
              await DBProvider.db.updatePosition(snapshot.data![index].title, "true");

              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PositionDetailsScreen(
                      positionTitle: snapshot.data![index].title,
                      positionContent: snapshot.data![index].content,
                      positionImage: snapshot.data![index].image,
                      positionCategory: snapshot.data![index].category,
                    ),
                  ),
                );
              }
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image(
                image: NetworkImage(snapshot.data![index].image),
                fit: BoxFit.cover,
              ),
            ),
        ) : Image(
          image: NetworkImage(snapshot.data![index].image),
          fit: BoxFit.cover,
        ),
      ),
    ),
  ),
);
