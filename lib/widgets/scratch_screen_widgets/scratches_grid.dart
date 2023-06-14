import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

import '../../models/position.dart';
import '../../providers/db_provider.dart';
import '../../providers/my_route.dart';
import '../../screens/position_details_screen.dart';
import '../../styles/theme.dart' as style;
import '../home_screen_widgets/custom_divider.dart';
import 'top_text.dart';

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
      child: Column(
        children: [
          topText(context),
          customDivider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
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
                        Navigator.pushReplacement(
                          context,
                          MyRoute(
                            builder: (_) => PositionDetailsScreen(
                              positionTitle: widget.positions[index].title,
                              positionContent: Platform.localeName.substring(0, 2) == "pl" ?
                                widget.positions[index].translateContentPL :
                                widget.positions[index].content,

                              // for positions_TEMP.json
                              // positionImage: widget.positions[index].category == "Animated" ?
                              //   AssetImage('assets/pos_img/${widget.positions[index].category}/${widget.positions[index].title}.gif') :
                              //   AssetImage('assets/pos_img/${widget.positions[index].category}/${widget.positions[index].title}.jpg'),

                              // for positions.json
                              positionImage: AssetImage('assets/pos_img/${widget.positions[index].category}/${widget.positions[index].title}.png'),
                              positionCategory: widget.positions[index].category,
                              positionURL: widget.positions[index].url,
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
                        // for positions_TEMP.json
                        // image: widget.positions[index].category == "Animated" ?
                        //   AssetImage('assets/pos_img/${widget.positions[index].category}/${widget.positions[index].title}.gif') :
                        //   AssetImage('assets/pos_img/${widget.positions[index].category}/${widget.positions[index].title}.jpg'),

                        // for positions.json
                        image: AssetImage('assets/pos_img/${widget.positions[index].category}/${widget.positions[index].title}.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
