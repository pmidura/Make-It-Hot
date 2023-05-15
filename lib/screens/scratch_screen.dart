import 'package:flutter/material.dart';

import '../models/position.dart';
import '../providers/db_provider.dart';
import '../widgets/info_widgets/empty_positions.dart';
import '../widgets/info_widgets/error_widget.dart';
import '../widgets/info_widgets/loading_widget.dart';
import '../widgets/scratch_screen_widgets/scratches_grid.dart';

class ScratchScreen extends StatefulWidget {
  final Function callback;
  final Function revealedCallback;
  final String categoryName;

  const ScratchScreen({
    super.key,
    required this.callback,
    required this.revealedCallback,
    required this.categoryName,
  });

  @override
  State<ScratchScreen> createState() => _ScratchScreenState();
}

class _ScratchScreenState extends State<ScratchScreen> {
  late Stream<List<Position>> notRevealedStream =
    DBProvider.db.getListOfNotRevealedPositions(
      categoryName: widget.categoryName,
    ).asStream();

  notRevealedCallback(newValue) {
    setState(() {
      notRevealedStream = newValue;
    });
  }

  @override
  Widget build(BuildContext context) => StreamBuilder(
    stream: notRevealedStream,
    builder: (BuildContext context, AsyncSnapshot<List<Position>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return loadingWidget();
      } else if (snapshot.hasError) {
        return errorWidget(snapshot.error.toString());
      } else if (snapshot.hasData) {
        if (snapshot.data!.isEmpty) {
          return const EmptyPositions(infoText: "Brak nowych pozycji!");
        }
        List<Position> positions = snapshot.data!;
        return ScratchesGrid(
          positions: positions,
          callback: widget.callback,
          notRevealedCallback: notRevealedCallback,
          revealedCallback: widget.revealedCallback,
          categoryName: widget.categoryName,
        );
      }
      return const EmptyPositions(infoText: "Brak nowych pozycji!");
    },
  );
}
