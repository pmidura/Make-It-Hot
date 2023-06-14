import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../styles/theme.dart' as style;
import 'category_button.dart';

Theme categoriesExpansionList({
  required BuildContext context,
  required Function callback,
}) {
  List<CategoryButton> categoriesBtns = [
    CategoryButton(callback: callback, categoryName: AppLocalizations.of(context)!.manOnTop),
    CategoryButton(callback: callback, categoryName: AppLocalizations.of(context)!.womanOnTop),
    CategoryButton(callback: callback, categoryName: AppLocalizations.of(context)!.oral),
    // CategoryButton(callback: callback, categoryName: AppLocalizations.of(context)!.threesome),
    // CategoryButton(callback: callback, categoryName: AppLocalizations.of(context)!.foursome),
    // CategoryButton(callback: callback, categoryName: AppLocalizations.of(context)!.spooning),
    CategoryButton(callback: callback, categoryName: AppLocalizations.of(context)!.acrobatic),
    CategoryButton(callback: callback, categoryName: AppLocalizations.of(context)!.kneeOrStand),
    // CategoryButton(callback: callback, categoryName: AppLocalizations.of(context)!.anal),
    // CategoryButton(callback: callback, categoryName: AppLocalizations.of(context)!.animated),
    // CategoryButton(callback: callback, categoryName: AppLocalizations.of(context)!.largPeople),
  ];

  categoriesBtns.sort((a, b) => a.categoryName.compareTo(b.categoryName));

  return Theme(
    data: Theme.of(context).copyWith(
      dividerColor: Colors.transparent,
      colorScheme: const ColorScheme.light(
        primary: Color.fromARGB(255, 100, 0, 255),
      ),
    ),
    child: ExpansionTile(
      trailing: const Icon(
        EvaIcons.arrowDownOutline,
      ),
      tilePadding: const EdgeInsets.symmetric(horizontal: 25.0),
      title: Text(
        AppLocalizations.of(context)!.categories,
        style: style.blackBold16(),
      ),
      children: [
        for (int i = 0; i < categoriesBtns.length; i++) categoriesBtns[i],
      ],
    ),
  );
}
