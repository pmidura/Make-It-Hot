import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../styles/theme.dart' as style;

Padding favouriteListTitle(BuildContext context) => Padding(
  padding: const EdgeInsets.fromLTRB(25.0, 65.0, 0.0, 15.0),
  child: Text(
    AppLocalizations.of(context)!.listOfFavPos,
    style: style.blackBold16(),
  ),
);
