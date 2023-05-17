import 'package:flutter/material.dart';

import '../../models/position.dart';
import '../../styles/theme.dart' as style;
import '../gradient_progess_widget/gradient_progress.dart';
import '../info_widgets/no_exposed_positions.dart';

class RevealedPositionsList extends StatefulWidget {
  final Stream<List<Position>> revealedStream;
  
  const RevealedPositionsList({
    super.key,
    required this.revealedStream,
  });
  
  @override
  State<RevealedPositionsList> createState() => _RevealedPositionsListState();
}

class _RevealedPositionsListState extends State<RevealedPositionsList> {
  @override
  Widget build(BuildContext context) => StreamBuilder(
    stream: widget.revealedStream,
    builder: (BuildContext context, AsyncSnapshot<List<Position>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const GradientProgress();
      } else if (snapshot.data!.isEmpty) {
        return noExposedPositions();
      }
      List<Position> revPositions = snapshot.data!;
      
      return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: revPositions.length,
        separatorBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 25.0),
            child: const Divider(thickness: 2),
          );
        },
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(revPositions[index].image),
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                revPositions[index].title,
                style: style.blackBold16(),
              ),
            ),
          );
        },
      );
    },
  );
}
