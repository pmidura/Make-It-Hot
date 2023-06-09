import 'package:flutter/material.dart';

import '../../providers/my_route.dart';
import '../../screens/selection_screen.dart';
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
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => Navigator.push(
      context,
      MyRoute(
        builder: (_) => Material(
          child: SelectionScreen(
            callback: widget.callback,
            categoryName: widget.categoryName,
          ),
        ),
      ),
    ),
    child: Padding(
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
