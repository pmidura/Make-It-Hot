import 'package:flutter/material.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';

import '../../providers/db_provider.dart';
import '../../styles/theme.dart' as style;

StreamBuilder2<int?, int?> categoryButtonCounter(String categoryName) => StreamBuilder2<int?, int?>(
  streams: StreamTuple2(
    DBProvider.db.getRevealedInCategory(categoryName: categoryName).asStream(),
    DBProvider.db.getCountAllInCategory(categoryName: categoryName).asStream(),
  ),
  builder: (context, snapshots) {
    if (snapshots.snapshot1.data == null || snapshots.snapshot2.data == null) {
      return RichText(
        text: const TextSpan(
          text: "",
        ),
      );
    }
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "${snapshots.snapshot1.data} / ",
            style: style.blackBold16(),
          ),
          TextSpan(
            text: snapshots.snapshot2.data.toString(),
            style: style.blackBold16(),
          ),
        ],
      ),
    );

    // return const CircularProgressIndicator();
  },
);
