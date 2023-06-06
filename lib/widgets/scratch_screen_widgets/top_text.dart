import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../styles/theme.dart' as style;

Padding topText(BuildContext context) => Padding(
  padding: const EdgeInsets.only(top: 60.0),
  child: Text(
    AppLocalizations.of(context)!.scratchToReveal,
    style: style.blackBold20(),
  ),
);
