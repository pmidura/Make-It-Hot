import 'package:flutter/material.dart';

import '../models/position.dart';
import '../providers/db_provider.dart';
import '../styles/theme.dart' as style;
import '../widgets/home_screen_widgets/app_logo.dart';
import '../widgets/home_screen_widgets/custom_divider.dart';
import '../widgets/selection_screen_widgets/discover_new_positions_btn.dart';
import '../widgets/selection_screen_widgets/revealed_list_title.dart';
import '../widgets/selection_screen_widgets/revealed_positions_list.dart';

class SelectionScreen extends StatefulWidget {
  final Function callback;
  final String categoryName;

  const SelectionScreen({
    super.key,
    required this.callback,
    required this.categoryName,
  });

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  late Stream<List<Position>> revealedStream =
    DBProvider.db.getListOfRevealedPositions(
      categoryName: widget.categoryName,
    ).asStream();

  revealedCallback(newValue) {
    setState(() {
      revealedStream = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: style.gradientContainer(),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          appLogo(),
          customDivider(),
          DiscoverNewPositionsBtn(
            callback: widget.callback,
            revealedCallback: revealedCallback,
            categoryName: widget.categoryName,
          ),
          customDivider(),
          revealedListTitle(),
          RevealedPositionsList(revealedStream: revealedStream),
        ],
      ),
    );
  }
}
