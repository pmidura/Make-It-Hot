import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../styles/theme.dart' as style;

Padding revealedListTitle(BuildContext context) => Padding(
  padding: const EdgeInsets.fromLTRB(25.0, 15.0, 0.0, 15.0),
  child: Text(
    AppLocalizations.of(context)!.listOfDiscovPos,
    style: style.blackBold16(),
  ),
);
