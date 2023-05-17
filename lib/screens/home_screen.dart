import 'package:flutter/material.dart';

import '../providers/db_provider.dart';
import '../styles/theme.dart' as style;
import '../widgets/home_screen_widgets/app_logo.dart';
import '../widgets/home_screen_widgets/author_info.dart';
import '../widgets/home_screen_widgets/category_button.dart';
import '../widgets/home_screen_widgets/custom_divider.dart';
import '../widgets/home_screen_widgets/categories_list_title.dart';
import '../widgets/home_screen_widgets/progress_bar.dart';
import '../widgets/home_screen_widgets/random_position_button.dart';
import '../widgets/splash_screen_widgets/app_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

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
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Align(
              alignment: Alignment.center,
              child: appName(),
            ),
          ),
          progressBar(),
          customDivider(),
          RandomPositionButton(callback: callback),
          customDivider(),
          categoriesListTitle(),
          CategoryButton(callback: callback, categoryName: "Man On Top"),
          CategoryButton(callback: callback, categoryName: "Woman On Top"),
          customDivider(),
          authorInfo(),
        ],
      ),
    ),
  );
}
