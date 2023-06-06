import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../styles/theme.dart' as style;

Widget categoriesListTitle(BuildContext context) => Padding(
  padding: const EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 10.0),
  child: Text(
    AppLocalizations.of(context)!.categories,
    style: style.blackBold16(),
  ),
);
