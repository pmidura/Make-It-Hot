import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../styles/theme.dart' as style;

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.positionTitle,
    required this.positionCategory,
    required this.positionContent,
    required this.positionURL,
  });

  final String positionTitle;
  final String positionCategory;
  final String positionContent;
  final String positionURL;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    positionTitle,
                    style: style.blackHalfOpacity13w600(),
                  ),
                ),
              ),
              Icon(
                EvaIcons.infoOutline,
                size: 16.0,
                color: Colors.black.withOpacity(0.5),
              ),
              const SizedBox(width: 5.0),
              Text(
                positionCategory,
                style: style.blackHalfOpacity13w600(),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
          child: Divider(
            thickness: 1,
            color: Colors.black26,
          ),
        ),
        Text(
          positionContent,
          textAlign: TextAlign.justify,
          style: style.blackBold14w400(),
        ),
        const Divider(
          thickness: 1,
          color: Colors.black26,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                EvaIcons.link,
                size: 16.0,
                color: Colors.black.withOpacity(0.5),
              ),
              const SizedBox(width: 5.0),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: positionURL,
                      style: style.urlStyle(),
                      recognizer: TapGestureRecognizer()..onTap = () async => await launchUrl(
                        Uri.parse(positionURL),
                        mode: LaunchMode.inAppWebView,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
