import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../models/position.dart';
import '../../providers/db_provider.dart';
import '../../styles/theme.dart' as style;

class TrailingStar extends StatefulWidget {
  final List<Position> favPositions;
  final int index;
  final Function callbackFavourite;

  const TrailingStar({
    super.key,
    required this.favPositions,
    required this.index,
    required this.callbackFavourite,
  });

  @override
  State<TrailingStar> createState() => _TrailingStarState();
}

class _TrailingStarState extends State<TrailingStar> {
  @override
  Widget build(BuildContext context) => IconButton(
    onPressed: () async {
      await DBProvider.db.removeFromFav(
        categoryName: widget.favPositions[widget.index].category,
        title: widget.favPositions[widget.index].title,
      );
      widget.callbackFavourite(DBProvider.db.getAllFavPositions().asStream());
    },
    icon: Icon(
      EvaIcons.star,
      color: style.starColor,
    ),
  );
}
