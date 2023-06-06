import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/position.dart';
import '../providers/db_provider.dart';
import '../styles/theme.dart' as style;
import '../widgets/info_widgets/error_widget.dart';
import '../widgets/info_widgets/loading_widget.dart';
import '../widgets/random_position_screen_widgets/random_pos_scratcher.dart';
import '../widgets/random_position_screen_widgets/random_revealed_position.dart';

class RandomPositionScreen extends StatefulWidget {
  final Function callback;

  const RandomPositionScreen({
    super.key,
    required this.callback,
  });

  @override
  State<RandomPositionScreen> createState() => _RandomPositionScreenState();
}

class _RandomPositionScreenState extends State<RandomPositionScreen> {
  @override
  Widget build(BuildContext context) => StreamBuilder(
    stream: DBProvider.db.getRandomPosition().asStream(),
    builder: (BuildContext context, AsyncSnapshot<List<Position>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return loadingWidget();
      } else if (snapshot.hasError) {
        return errorWidget(snapshot.error.toString());
      } else if (snapshot.data!.isEmpty) {
        return randomRevealedPosition();
      }
      List<Position> randPosition = snapshot.data!;
      return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: style.gradientContainer(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                AppLocalizations.of(context)!.scratchToReveal,
                style: style.blackBold16(),
              ),
            ),
            RandomPosScratcher(
              randPosition: randPosition,
              widget: widget,
            ),
          ],
        ),
      );
    },
  );
}
