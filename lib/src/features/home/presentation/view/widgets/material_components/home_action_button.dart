import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/filter/date_filters.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/filter/field_radio_buttons.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/filter/rows_dropdown_button.dart';

import '../filter/filters_model_bottom_sheet.dart';
import 'show_filters_modal_bottom_sheet.dart';

class HomeActionButton extends StatefulWidget {
  const HomeActionButton({super.key});

  @override
  State<HomeActionButton> createState() => _HomeActionButtonState();
}

class _HomeActionButtonState extends State<HomeActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).colorScheme.tertiary
          : null,
      onPressed: () {
        showFiltersModalBottomSheet(context);
      },
      child: const Icon(
        Icons.settings,
      ),
    );
  }
}
