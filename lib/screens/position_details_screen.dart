import 'package:flutter/material.dart';

import '../styles/theme.dart' as style;
import '../widgets/position_details_screen_widgets/info_widget.dart';
import '../widgets/position_details_screen_widgets/top_widget.dart';

class PositionDetailsScreen extends StatelessWidget {
  final String positionTitle;
  final String positionContent;
  final AssetImage positionImage;
  final String positionCategory;

  const PositionDetailsScreen({
    super.key,
    required this.positionTitle,
    required this.positionContent,
    required this.positionImage,
    required this.positionCategory,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: style.gradientContainer(),
      child: Column(
        children: [
          TopWidget(positionImage: positionImage),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                InfoWidget(
                  positionTitle: positionTitle,
                  positionCategory: positionCategory,
                  positionContent: positionContent,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
