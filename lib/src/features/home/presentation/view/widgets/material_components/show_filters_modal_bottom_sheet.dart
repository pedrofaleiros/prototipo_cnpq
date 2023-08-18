import 'package:flutter/material.dart';

import '../filter/filters_model_bottom_sheet.dart';

Future<dynamic> showFiltersModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: Theme.of(context).brightness == Brightness.dark
        ? const Color(0xff111111)
        : null,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25),
      ),
    ),
    context: context,
    builder: (context) {
      return const FiltersModalBottomSheet();
    },
  );
}
