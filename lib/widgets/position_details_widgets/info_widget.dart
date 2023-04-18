import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.positionCategory,
    required this.positionContent,
  });

  final String positionCategory;
  final String positionContent;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              EvaIcons.infoOutline,
              size: 15.0,
              color: Colors.white.withOpacity(0.5),
            ),
            const SizedBox(width: 5.0),
            Text(
              positionCategory,
              style: TextStyle(
                fontSize: 11.0,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        Text(
          "OPIS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          positionContent,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            height: 1.5,
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
