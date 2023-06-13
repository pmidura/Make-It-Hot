import 'package:flutter/material.dart';

import '../providers/db_provider.dart';
import '../styles/theme.dart' as style;
import '../widgets/home_screen_widgets/app_home_name.dart';
import '../widgets/home_screen_widgets/app_logo.dart';
import '../widgets/home_screen_widgets/author_info.dart';
import '../widgets/home_screen_widgets/categories_expansion_list.dart';
import '../widgets/home_screen_widgets/custom_divider.dart';
import '../widgets/home_screen_widgets/custom_divider2.dart';
import '../widgets/home_screen_widgets/favourite_positions_button.dart';
import '../widgets/home_screen_widgets/progress_bar.dart';
import '../widgets/home_screen_widgets/random_position_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream<int?> revealedStream = DBProvider.db.getNumberOfRevealedPositions().asStream();

  callback(newValue) {
    setState(() {
      revealedStream = newValue;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: style.gradientContainer(),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          appLogo(),
          appHomeName(),
          progressBar(),
          customDivider2(),
          categoriesExpansionList(
            context: context,
            callback: callback,
          ),
          customDivider(),
          RandomPositionButton(callback: callback),
          const FavouritePositionsButton(),
          customDivider(),
          authorInfo(),
        ],
      ),
    ),
  );
}
