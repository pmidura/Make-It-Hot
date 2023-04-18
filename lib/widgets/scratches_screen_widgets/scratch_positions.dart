import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

import '../../bloc/positions/positions_cubit.dart';
import '../../screens/position_details_screen.dart';
import '../../styles/theme.dart' as style;

class ScratchPositions extends StatelessWidget {
  const ScratchPositions({
    super.key,
    required this.state,
  });

  final PositionsState state;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: style.gradientContainer(),
      child: Padding(
      padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: state.positions.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Scratcher(
              color: Colors.deepPurple.shade100,
              brushSize: 30,
              accuracy: ScratchAccuracy.low,
              threshold: 70,
              onThreshold: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PositionDetailsScreen(
                    positionTitle: state.positions[index].title,
                    positionContent: state.positions[index].content,
                    positionImage: state.positions[index].image,
                    positionCategory: state.positions[index].category,
                  ),
                ),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Image(
                  image: NetworkImage(state.positions[index].image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
