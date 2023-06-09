import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

import '../../models/position.dart';
import '../../providers/db_provider.dart';
import '../../providers/my_route.dart';
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
            MyRoute(
              builder: (_) => PositionDetailsScreen(
                positionTitle: randPosition.first.title,
                positionContent: Platform.localeName.substring(0, 2) == "pl" ?
                  randPosition.first.translateContentPL :
                  randPosition.first.content,
                positionImage: randPosition.first.category == "Animated" ?
                  AssetImage('assets/pos_img/${randPosition.first.category}/${randPosition.first.title}.gif') :
                  AssetImage('assets/pos_img/${randPosition.first.category}/${randPosition.first.title}.jpg'),
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
          image: randPosition.first.category == "Animated" ?
            AssetImage('assets/pos_img/${randPosition.first.category}/${randPosition.first.title}.gif') :
            AssetImage('assets/pos_img/${randPosition.first.category}/${randPosition.first.title}.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
