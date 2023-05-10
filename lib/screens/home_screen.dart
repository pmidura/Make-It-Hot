import 'package:flutter/material.dart';

import '../styles/theme.dart' as style;
import '../widgets/home_screen_widgets/category_button.dart';
import '../widgets/home_screen_widgets/position_draw_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: style.gradientContainer(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50.0),
            Image.asset(
              "assets/biting_lips.png",
              width: 150.0,
              height: 150.0,
            ),
            const SizedBox(height: 20.0),
            positionDrawButton(context: context),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    categoryButton(
                      context: context,
                      categoryName: "Man On Top",
                      tableName: "ManOnTop",
                    ),
                    const SizedBox(height: 20.0),
                    categoryButton(
                      context: context,
                      categoryName: "Woman On Top",
                      tableName: "WomanOnTop",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),


            // FutureBuilder(
            //   // future: PositionRepo().getNumberOfPositionsFromTable(
            //   //   database: context.read<DatabaseCubit>().database!,
            //   //   tableName: "ManOnTop",
            //   // ),
            //   future: PositionRepo().getCountPositionsFromAllTables(
            //     database: context.read<DatabaseCubit>().database!,
            //   ),
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {
            //     if (snapshot.hasData) {
            //       return Center(child: Text(snapshot.data.toString()));
            //     }
            //     return const Text("");
            //   }
            // ),
      ),
    ),
  );
}
