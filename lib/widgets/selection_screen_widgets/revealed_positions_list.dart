import 'dart:io';

import 'package:flutter/material.dart';

import '../../models/position.dart';
import '../../providers/my_route.dart';
import '../../screens/position_details_screen.dart';
import '../../styles/theme.dart' as style;
import '../gradient_progess_widget/gradient_progress.dart';
import '../info_widgets/no_exposed_positions.dart';
import 'favourite_star.dart';

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
        return noExposedPositions(context);
      }
      List<Position> revPositions = snapshot.data!;
      Platform.localeName.substring(0, 2) == "pl" ?
        revPositions.sort((a, b) => a.translateTitlePL.compareTo(b.translateTitlePL)) :
        revPositions.sort((a, b) => a.title.compareTo(b.title));
      
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
              onTap: () => Navigator.push(
                context,
                MyRoute(
                  builder: (_) => PositionDetailsScreen(
                    positionTitle: Platform.localeName.substring(0, 2) == "pl" ?
                      revPositions[index].translateTitlePL :
                      revPositions[index].title,
                    positionContent: Platform.localeName.substring(0, 2) == "pl" ?
                      revPositions[index].translateContentPL :
                      revPositions[index].content,

                    // for positions_TEMP.json
                    // positionImage: revPositions[index].category == "Animated" ?
                    //   AssetImage('assets/pos_img/${revPositions[index].category}/${revPositions[index].title}.gif') :
                    //   AssetImage('assets/pos_img/${revPositions[index].category}/${revPositions[index].title}.jpg'),

                    // for positions.json
                    positionImage: AssetImage('assets/pos_img/${revPositions[index].category}/${revPositions[index].title}.png'),
                    positionCategory: Platform.localeName.substring(0, 2) == "pl" ?
                      revPositions[index].translateCategoryPL :
                      revPositions[index].category,
                    positionURL: revPositions[index].url,
                  ),
                ),
              ),
              leading: CircleAvatar(
                radius: 25.0,

                // for positions_TEMP.json
                // backgroundImage: revPositions[index].category == "Animated" ?
                //   AssetImage('assets/pos_img/${revPositions[index].category}/${revPositions[index].title}.gif') :
                //   AssetImage('assets/pos_img/${revPositions[index].category}/${revPositions[index].title}.jpg'),

                // for positions.json
                backgroundImage: AssetImage('assets/pos_img/${revPositions[index].category}/${revPositions[index].title}.png'),
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                Platform.localeName.substring(0, 2) == "pl" ?
                  revPositions[index].translateTitlePL :
                  revPositions[index].title,
                style: style.blackBold16(),
                overflow: TextOverflow.ellipsis,
              ),
              trailing: FavouriteStar(
                revPositions: revPositions,
                index: index,
              ),
            ),
          );
        },
      );
    },
  );
}
