import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../styles/theme.dart' as style;

Widget authorInfo() => Padding(
  padding: const EdgeInsets.only(bottom: 25.0),
  child: Align(
    alignment: Alignment.bottomCenter,
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '2023 \u00a9 Midura Patryk & ',
            style: style.blackHalfOpacity13w600(),
          ),
          TextSpan(
            text: 'SexPositions.Club',
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
