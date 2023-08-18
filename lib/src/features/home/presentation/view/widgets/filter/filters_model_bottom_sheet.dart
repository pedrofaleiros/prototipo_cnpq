import 'package:flutter/material.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

import 'date_filters.dart';
import 'field_radio_buttons.dart';
import 'rows_dropdown_button.dart';

class FiltersModalBottomSheet extends StatelessWidget {
  const FiltersModalBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        TopWidget(),
        SizedBox(height: 20),
        Text(
          'Filtros',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 5),
        Divider(),
        FieldRadioButtons(),
        DateFilters(),
        RowsDropdownButton(),
        Divider(),
        BottomWidget(),
      ],
    );
  }
}

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                FocusScope.of(context).unfocus();
                await context.read<HomeViewModel>().loadArticles();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Theme.of(context).brightness == Brightness.dark
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Aplicar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopWidget extends StatelessWidget {
  const TopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 35,
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

/* 
SizedBox(height: 20),
const FieldRadioButtons(),
SizedBox(height: 20),
const DateFilters(),
SizedBox(height: 20),
const RowsDropdownButton(),
SizedBox(height: 20),
 */