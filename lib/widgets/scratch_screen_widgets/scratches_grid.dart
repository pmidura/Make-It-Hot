import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

import '../../models/position.dart';
import '../../providers/db_provider.dart';
import '../../screens/position_details_screen.dart';
import '../../styles/theme.dart' as style;

class ScratchesGrid extends StatefulWidget {
  final List<Position> positions;
  final Function callback;
  final Function notRevealedCallback;
  final Function revealedCallback;
  final String categoryName;

  const ScratchesGrid({
    super.key,
    required this.positions,
    required this.callback,
    required this.notRevealedCallback,
    required this.revealedCallback,
    required this.categoryName,
  });

  @override
  State<ScratchesGrid> createState() => _ScratchesGridState();
}

class _ScratchesGridState extends State<ScratchesGrid> {
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    height: double.infinity,
    decoration: style.gradientContainer(),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: widget.positions.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Scratcher(
            color: Colors.deepPurple.shade100,
            brushSize: 30,
            accuracy: ScratchAccuracy.low,
            threshold: 70,
            onThreshold: () async {
              await DBProvider.db.updatePosition(
                title: widget.positions[index].title,
                isRevealed: "true",
              );
              widget.callback(DBProvider.db.getNumberOfRevealedPositions().asStream());
              if (context.mounted) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PositionDetailsScreen(
                      positionTitle: widget.positions[index].title,
                      positionContent: widget.positions[index].content,
                      positionImage: widget.positions[index].image,
                      positionCategory: widget.positions[index].category,
                    ),
                  ),
                );
              }
              widget.notRevealedCallback(
                DBProvider.db.getListOfNotRevealedPositions(
                  categoryName: widget.categoryName,
                ).asStream(),
              );
              widget.revealedCallback(
                DBProvider.db.getListOfRevealedPositions(
                  categoryName: widget.categoryName,
                ).asStream(),
              );
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image(
                image: NetworkImage(widget.positions[index].image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
