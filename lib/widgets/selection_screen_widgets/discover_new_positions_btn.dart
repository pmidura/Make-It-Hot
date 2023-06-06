import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../screens/scratch_screen.dart';
import '../../styles/theme.dart' as style;

class DiscoverNewPositionsBtn extends StatefulWidget {
  final Function callback;
  final Function revealedCallback;
  final String categoryName;

  const DiscoverNewPositionsBtn({
    super.key,
    required this.callback,
    required this.revealedCallback,
    required this.categoryName,
  });

  @override
  State<DiscoverNewPositionsBtn> createState() => _DiscoverNewPositionsBtnState();
}

class _DiscoverNewPositionsBtnState extends State<DiscoverNewPositionsBtn> {
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
      revealedCallback: widget.revealedCallback,
      categoryName: widget.categoryName,
    ),
    closedBuilder: (_, __) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 60.0),
          child: Text(
            AppLocalizations.of(context)!.shallWeStartFun,
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
                  AppLocalizations.of(context)!.discoverNewPos,
                  style: style.blackBold16(),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
