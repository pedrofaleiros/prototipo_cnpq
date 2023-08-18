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
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Data inicial',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Expanded(child: Container()),
                DropdownButton<int>(
                  menuMaxHeight: 250,
                  hint: const Text('inicio'),
                  value: context.read<HomeViewModel>().filter.initialDate,
                  items: _getItems(),
                  onChanged: (int? num) {
                    context.read<HomeViewModel>().filter.setInitialDate(num);
                  },
                ),
                IconButton(
                  color: Theme.of(context).colorScheme.error,
                  onPressed: () {
                    context.read<HomeViewModel>().filter.resetInitialDate();
                  },
                  icon: Icon(
                    Icons.close,
                    size: 16,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Data final',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
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
                IconButton(
                  color: Theme.of(context).colorScheme.error,
                  onPressed: () {
                    context.read<HomeViewModel>().filter.resetFinallDate();
                  },
                  icon: Icon(
                    Icons.close,
                    size: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
