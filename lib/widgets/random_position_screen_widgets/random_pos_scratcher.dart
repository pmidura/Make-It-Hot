import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

import '../../models/position.dart';
import '../../providers/db_provider.dart';
import '../../screens/position_details_screen.dart';
import '../../screens/random_position_screen.dart';

class RandomPosScratcher extends StatelessWidget {
  const RandomPosScratcher({
    super.key,
    required this.randPosition,
    required this.widget,
  });

  final List<Position> randPosition;
  final RandomPositionScreen widget;

  @override
  Widget build(BuildContext context) {
    return Scratcher(
      color: Colors.deepPurple.shade100,
      brushSize: 30,
      accuracy: ScratchAccuracy.low,
      threshold: 70,
      onThreshold: () async {
        await DBProvider.db.updatePosition(
          title: randPosition.first.title,
          isRevealed: "true",
        );

        widget.callback(DBProvider.db.getNumberOfRevealedPositions().asStream());
        
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => PositionDetailsScreen(
                positionTitle: randPosition.first.title,
                positionContent: randPosition.first.content,
                positionImage: randPosition.first.image,
                positionCategory: randPosition.first.category,
              ),
            ),
          );
        }
      },
      child: SizedBox(
        width: 200.0,
        height: 200.0,
        child: Image(
          image: NetworkImage(randPosition.first.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
