import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/position_bloc/position_bloc.dart';
import '../../screens/home_screen.dart';
import '../../widgets/info_widgets/error_widget.dart';
import '../../widgets/info_widgets/loading_widget.dart';

BlocConsumer<PositionBloc, PositionState> childConsumerPosition() => BlocConsumer<PositionBloc, PositionState>(
  listener: (context, state) {},
  builder: (context, state) {
    if (state is LoadingState) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: loadingWidget(),
      );
    } else if (state is ErrorState) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: errorWidget(state.error),
      );
    } else if (state is LoadedState) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loadingWidget(),
    );
  },
);
