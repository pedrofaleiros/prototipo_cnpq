import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/filter/date_filters.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/filter/field_radio_buttons.dart';

import 'rows_dropdown_button.dart';

class FiltersDialog extends StatelessWidget {
  const FiltersDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      title: const Text('Configurações de busca'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Ok',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            FieldRadioButtons(),
            SizedBox(height: 10),
            DateFilters(),
            SizedBox(height: 10),
            RowsDropdownButton(),
          ],
        ),
      ),
    );
  }
}
