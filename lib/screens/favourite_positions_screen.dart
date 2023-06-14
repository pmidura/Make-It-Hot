import 'package:flutter/material.dart';

import '../models/position.dart';
import '../providers/db_provider.dart';
import '../styles/theme.dart' as style;
import '../widgets/favourite_positions_screen_widgets/favourite_list_title.dart';
import '../widgets/favourite_positions_screen_widgets/favourite_positions_list.dart';
import '../widgets/info_widgets/image_provider.dart';

class FavouritePositionsScreen extends StatefulWidget {
  const FavouritePositionsScreen({
    super.key,
  });

  @override
  State<FavouritePositionsScreen> createState() => _FavouritePositionsScreenState();
}

class _FavouritePositionsScreenState extends State<FavouritePositionsScreen> {
  Stream<List<Position>> favouriteStream = DBProvider.db.getAllFavPositions().asStream();

  callbackFavourite(newValue) {
    setState(() {
      favouriteStream = newValue;
    });
  }

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    height: double.infinity,
    decoration: style.gradientContainer(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        favouriteListTitle(context),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              FavouritePositionsList(
                favouriteStream: favouriteStream,
                callbackFavourite: callbackFavourite,
              ),
            ],
          ),
        ),
        imageProvider(context),
      ],
    ),
  );
}
