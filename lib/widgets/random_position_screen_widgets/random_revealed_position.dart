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
      positionTitle: randRevPosition.first.title,
      positionContent: randRevPosition.first.content,
      positionImage: randRevPosition.first.image,
      positionCategory: randRevPosition.first.category,
    );
  },
);