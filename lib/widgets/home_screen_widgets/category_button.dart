import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../screens/scratch_screen.dart';
import '../../styles/theme.dart' as style;
import 'category_button_counter.dart';

class CategoryButton extends StatefulWidget {
  final Function callback;
  final String categoryName;

  const CategoryButton({
    super.key,
    required this.callback,
    required this.categoryName,
  });

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) => OpenContainer(
    closedColor: Colors.transparent,
    closedElevation: 0,
    middleColor: Colors.transparent,
    openColor: Colors.transparent,
    openElevation: 0,
    transitionDuration: const Duration(milliseconds: 500),
    transitionType: ContainerTransitionType.fadeThrough,
    openBuilder: (_, __) => ScratchScreen(
      callback: widget.callback,
      categoryName: widget.categoryName,
    ),
    closedBuilder: (_, __) => Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
          gradient: style.purpleLinearGradient(),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.categoryName,
              style: style.blackBold16(),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: categoryButtonCounter(widget.categoryName),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
