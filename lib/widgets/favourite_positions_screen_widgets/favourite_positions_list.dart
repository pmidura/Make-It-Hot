import 'package:flutter/material.dart';

import '../../models/position.dart';
import '../../screens/position_details_screen.dart';
import '../../styles/theme.dart' as style;
import '../gradient_progess_widget/gradient_progress.dart';
import '../info_widgets/no_fav_positions.dart';
import 'trailing_star.dart';

class FavouritePositionsList extends StatefulWidget {
  final Stream<List<Position>> favouriteStream;
  final Function callbackFavourite;

  const FavouritePositionsList({
    super.key,
    required this.favouriteStream,
    required this.callbackFavourite,
  });
  
  @override
  State<FavouritePositionsList> createState() => _FavouritePositionsListState();
}

class _FavouritePositionsListState extends State<FavouritePositionsList> {
  @override
  Widget build(BuildContext context) => StreamBuilder(
    stream: widget.favouriteStream,
    builder: (BuildContext context, AsyncSnapshot<List<Position>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const GradientProgress();
      } else if (snapshot.data!.isEmpty) {
        return noFavPositions();
      }
      List<Position> favPositions = snapshot.data!;
      
      return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: favPositions.length,
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
                MaterialPageRoute(
                  builder: (_) => PositionDetailsScreen(
                    positionTitle: favPositions[index].title,
                    positionContent: favPositions[index].content,
                    positionImage: favPositions[index].category == "Animated" ?
                      AssetImage('assets/pos_img/${favPositions[index].category}/${favPositions[index].title}.gif') :
                      AssetImage('assets/pos_img/${favPositions[index].category}/${favPositions[index].title}.jpg'),
                    positionCategory: favPositions[index].category,
                  ),
                ),
              ),
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage: favPositions[index].category == "Animated" ?
                  AssetImage('assets/pos_img/${favPositions[index].category}/${favPositions[index].title}.gif') :
                  AssetImage('assets/pos_img/${favPositions[index].category}/${favPositions[index].title}.jpg'),
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                favPositions[index].title,
                style: style.blackBold16(),
              ),
              trailing: TrailingStar(
                favPositions: favPositions,
                index: index,
                callbackFavourite: widget.callbackFavourite,
              ),
            ),
          );
        },
      );
    },
  );
}
