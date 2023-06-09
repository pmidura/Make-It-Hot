import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../providers/my_route.dart';
import '../../screens/random_position_screen.dart';
import '../../styles/theme.dart' as style;

class RandomPositionButton extends StatefulWidget {
  final Function callback;

  const RandomPositionButton({
    super.key,
    required this.callback,
  });

  @override
  State<RandomPositionButton> createState() => _RandomPositionButtonState();
}

class _RandomPositionButtonState extends State<RandomPositionButton> {
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => Navigator.push(
      context,
      MyRoute(
        builder: (_) => Material(
          child: RandomPositionScreen(
            callback: widget.callback,
          ),
        ),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            AppLocalizations.of(context)!.cantDecide,
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
                  AppLocalizations.of(context)!.surpriseMe,
                  style: style.blackBold16(),
                ),
                const SizedBox(width: 5.0),
                const Icon(EvaIcons.giftOutline),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
