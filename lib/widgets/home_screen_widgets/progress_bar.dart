import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../providers/db_provider.dart';
import '../../styles/theme.dart' as style;
import '../gradient_progess_widget/gradient_progress.dart';

Widget progressBar() => StreamBuilder2<int?, int?>(
  streams: StreamTuple2(
    DBProvider.db.getNumberOfRevealedPositions().asStream(),
    DBProvider.db.getNumberOfAllPositions().asStream(),
  ),
  builder: (context, snapshots) {
    if (snapshots.snapshot1.data == null || snapshots.snapshot2.data == null) {
      return const GradientProgress();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            AppLocalizations.of(context)!.yourProgress,
            style: style.blackBold16(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 10.0, 30.0, 20.0),
          child: LinearPercentIndicator(
            animation: true,
            lineHeight: 30.0,
            animationDuration: 2500,
            percent: (snapshots.snapshot1.data! / snapshots.snapshot2.data!),
            trailing: Text(
              "${((snapshots.snapshot1.data! / snapshots.snapshot2.data!) * 100).toStringAsFixed(2)} %",
              style: style.blackBold16(),
            ),
            barRadius: const Radius.circular(20.0),
            linearGradient: style.purpleLinearGradient(),
            backgroundColor: const Color.fromARGB(255, 195, 165, 235),
          ),
        ),
      ],
    );
  },
);
