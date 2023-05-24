import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../models/position.dart';
import '../../providers/db_provider.dart';
import '../../styles/theme.dart' as style;

class FavouriteStar extends StatefulWidget {
  final List<Position> revPositions;
  final int index;

  const FavouriteStar({
    super.key,
    required this.revPositions,
    required this.index,
  });
  
  @override
  State<FavouriteStar> createState() => _FavouriteStarState();
}

class _FavouriteStarState extends State<FavouriteStar> {
  @override
  Widget build(BuildContext context) => StreamBuilder(
    stream: DBProvider.db.getFavValue(
      categoryName: widget.revPositions[widget.index].category,
      title: widget.revPositions[widget.index].title,
    ).asStream(),
    builder: (context, snapshot) {
      if (snapshot.data == null) {
        return CircularProgressIndicator(
          color: style.starColor,
          strokeWidth: 2.0,
        );
      }
      return snapshot.data[0]["isFavourite"] == "false" ? IconButton(
        onPressed: () async {
          await DBProvider.db.addToFav(
            categoryName: widget.revPositions[widget.index].category,
            title: widget.revPositions[widget.index].title,
          );
          setState(() => DBProvider.db.getFavValue(
            categoryName: widget.revPositions[widget.index].category,
            title: widget.revPositions[widget.index].title,
          ).asStream());
        },
        icon: Icon(
          EvaIcons.starOutline,
          color: style.starColor,
        ),
      ) : IconButton(
        onPressed: () async {
          await DBProvider.db.removeFromFav(
            categoryName: widget.revPositions[widget.index].category,
            title: widget.revPositions[widget.index].title,
          );
          setState(() => DBProvider.db.getFavValue(
            categoryName: widget.revPositions[widget.index].category,
            title: widget.revPositions[widget.index].title,
          ).asStream());
        },
        icon: Icon(
          EvaIcons.star,
          color: style.starColor,
        ),
      );
    },
  );
}
