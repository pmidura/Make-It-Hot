import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../styles/theme.dart' as style;

Padding imageProvider() => Padding(
  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
  child: Align(
    alignment: Alignment.bottomCenter,
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "The images are provided by the ",
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
