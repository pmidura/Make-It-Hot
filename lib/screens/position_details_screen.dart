import 'package:flutter/material.dart';

import '../widgets/position_details_widgets/info_widget.dart';
import '../widgets/position_details_widgets/top_widget.dart';

class PositionDetailsScreen extends StatelessWidget {
  final String positionTitle;
  final String positionContent;
  final String positionImage;
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
    backgroundColor: const Color(0xFF151C26),
    body: ListView(
      padding: EdgeInsets.zero,
      children: [
        TopWidget(positionImage: positionImage),
        InfoWidget(positionCategory: positionCategory, positionContent: positionContent),
      ],
    ),
  );
}
