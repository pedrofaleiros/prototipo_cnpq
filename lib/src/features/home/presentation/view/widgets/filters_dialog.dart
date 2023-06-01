import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/date_filters.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/view/widgets/field_radio_buttons.dart';

import 'rows_dropdown_button.dart';

class FiltersDialog extends StatelessWidget {
  const FiltersDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filtros'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Voltar',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          FieldRadioButtons(),
          SizedBox(height: 10),
          DateFilters(),
          SizedBox(height: 10),
          RowsDropdownButton(),
        ],
      ),
    );
  }
}
