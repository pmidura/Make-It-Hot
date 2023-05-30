import 'package:animations/animations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../screens/favourite_positions_screen.dart';
import '../../styles/theme.dart' as style;

class FavouritePositionsButton extends StatefulWidget {
  const FavouritePositionsButton({
    super.key,
  });

  @override
  State<FavouritePositionsButton> createState() => _FavouritePositionsButtonState();
}

class _FavouritePositionsButtonState extends State<FavouritePositionsButton> {
  @override
  Widget build(BuildContext context) => OpenContainer(
    closedColor: Colors.transparent,
    closedElevation: 0,
    middleColor: Colors.transparent,
    openColor: Colors.transparent,
    openElevation: 0,
    transitionDuration: const Duration(milliseconds: 500),
    transitionType: ContainerTransitionType.fadeThrough,
    openBuilder: (_, __) => const FavouritePositionsScreen(),
    closedBuilder: (_, __) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            "Favourite positions",
            style: style.blackBold16(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
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
                  "View positions!",
                  style: style.blackBold16(),
                ),
                const SizedBox(width: 5.0),
                const Icon(EvaIcons.eyeOutline),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
