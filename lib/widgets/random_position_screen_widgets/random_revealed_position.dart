import 'dart:io';

import 'package:flutter/material.dart';

import '../../models/position.dart';
import '../../providers/db_provider.dart';
import '../../screens/position_details_screen.dart';
import '../info_widgets/error_widget.dart';
import '../info_widgets/loading_widget.dart';

StreamBuilder<List<Position>> randomRevealedPosition() => StreamBuilder(
  stream: DBProvider.db.getRandomRevealedPosition().asStream(),
  builder: (BuildContext randRevContext, AsyncSnapshot<List<Position>> randRevSnapshot) {
    if (randRevSnapshot.connectionState == ConnectionState.waiting) {
      return loadingWidget();
    } else if (randRevSnapshot.hasError) {
      return errorWidget(randRevSnapshot.error.toString());
    }
    List<Position> randRevPosition = randRevSnapshot.data!;
    return PositionDetailsScreen(
      positionTitle: Platform.localeName.substring(0, 2) == "pl" ?
        randRevPosition.first.translateTitlePL :
        randRevPosition.first.title,
      positionContent: Platform.localeName.substring(0, 2) == "pl" ?
        randRevPosition.first.translateContentPL :
        randRevPosition.first.content,

      // for positions_TEMP.json
      // positionImage: randRevPosition.first.category == "Animated" ?
      //   AssetImage('assets/pos_img/${randRevPosition.first.category}/${randRevPosition.first.title}.gif') :
      //   AssetImage('assets/pos_img/${randRevPosition.first.category}/${randRevPosition.first.title}.jpg'),

      // for positions.json
      positionImage: AssetImage('assets/pos_img/${randRevPosition.first.category}/${randRevPosition.first.title}.png'),
      positionCategory: Platform.localeName.substring(0, 2) == "pl" ?
        randRevPosition.first.translateCategoryPL :
        randRevPosition.first.category,
      positionURL: randRevPosition.first.url,
    );
  },
);
