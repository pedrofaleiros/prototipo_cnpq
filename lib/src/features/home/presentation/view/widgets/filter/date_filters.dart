import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prototipo_cnpq/src/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

class DateFilters extends StatelessWidget {
  const DateFilters({super.key});

  DropdownMenuItem<int> _dropdownMenuItem(int value) {
    return DropdownMenuItem(
      value: value,
      child: Text('$value'),
    );
  }

  List<DropdownMenuItem<int>> _getItems() {
    List<DropdownMenuItem<int>> list = [];
    for (var i = 2023; i >= 2010; i--) {
      list.add(_dropdownMenuItem(i));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Row(
        children: [
          const Text('Data:'),
          const SizedBox(width: 10),
          DropdownButton<int>(
            menuMaxHeight: 250,
            hint: const Text('inicio'),
            value: context.read<HomeViewModel>().filter.initialDate,
            items: _getItems(),
            onChanged: (int? num) {
              context.read<HomeViewModel>().filter.setInitialDate(num);
            },
          ),
          Expanded(child: Container()),
          const Text('-'),
          Expanded(child: Container()),
          DropdownButton<int>(
            menuMaxHeight: 250,
            hint: const Text('fim'),
            value: context.read<HomeViewModel>().filter.finalDate,
            items: _getItems(),
            onChanged: (int? num) {
              context.read<HomeViewModel>().filter.setFinalDate(num);
            },
          ),
        ],
      ),
    );
  }
}
