import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../styles/theme.dart' as style;

Padding imageProvider(BuildContext context) => Padding(
  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
  child: Align(
    alignment: Alignment.bottomCenter,
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: AppLocalizations.of(context)!.imageProviderText,
            style: style.blackHalfOpacity13w600(),
          ),
          TextSpan(
            text: "SexPositions.Club",
            style: style.urlStyle(),
            recognizer: TapGestureRecognizer()..onTap = () async => await launchUrl(
              Uri.parse("https://sexpositions.club/"),
              mode: LaunchMode.inAppWebView,
            ),
          ),
        ],
      ),
    ),
  ),
);
